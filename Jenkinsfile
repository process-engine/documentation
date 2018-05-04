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
      when {
        branch 'develop'
      }
      steps {
        script {
          dir('work') {
            checkout([
              $class: 'GitSCM',
              branches: [
                [name: '*/develop'],
                [name: '*/gh-pages']
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
              sh('git checkout develop')
              sh('git clean -xdf')
              sh('bash build_prod.sh')
              sh('git add --all .')
              sh('git commit --message ":rocket: Automatic Build And Deploy"')
              sh('git push origin gh-pages')
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
        cleanup_workspace();
      }
    }
  }
}
