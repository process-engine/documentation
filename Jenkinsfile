#!/usr/bin/env groovy

def cleanup_workspace() {
  cleanWs()
  dir("${env.WORKSPACE}@tmp") {
    deleteDir()
  }
  dir("${env.WORKSPACE}@script") {
    deleteDir()
  }
  dir("${env.WORKSPACE}@script@tmp") {
    deleteDir()
  }
}

pipeline {
  agent any
  tools {
    nodejs "node-lts"
  }

  stages {
    stage('test links') {
      steps {
        sh 'bash ci-tools/checkLinks.sh'
      }
    }

    stage('build and publish') {
      steps {
        script {
          dir('work') {
            checkout([
              $class: 'GitSCM',
              branches: [
                [name: '*/develop'],
                [name: '*/feature/auto_deploy_gh_pages'],
                [name: '*/gh-pages-test']
              ],
              doGenerateSubmoduleConfigurations: false,
              extensions: [
                [$class: 'WipeWorkspace'],
                [$class: 'CleanBeforeCheckout']
              ],
              submoduleCfg: [],
              userRemoteConfigs: [
                [
                  credentialsId: 'ci-process-engine_ssh_key',
                  url: 'git@github.com:process-engine/documentation.git'
                ]
              ]
            ]);
            sshagent(['ci-process-engine_ssh_key']) {
              sh('git checkout feature/auto_deploy_gh_pages')
              sh('git clean -xdf')
              sh('bash build_prod.sh')
              sh('git add --all .')
              sh('git commit --message ":rocket: Automatic Build And Deploy"')
              sh('git push origin gh-pages-test')
              sh('git checkout feature/auto_deploy_gh_pages')
              sh('git status')
              sh('git checkout develop')
              sh('git status')
            }
          }
        }
      }
    }
    stage('cleanup') {
      steps {
        script {
          // this stage just exists, so the cleanup-work that happens in the post-script
          // will show up in its own stage in Blue Ocean
          sh(script: ':', returnStdout: true);
        }
      }
    }
  }
  post {
    always {
      script {
        echo "a"
        // cleanup_workspace();
      }
    }
  }
}
