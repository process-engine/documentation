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
          checkout([
            $class: 'GitSCM',
            branches: [
              [name: '*/master'],
              [name: '*/target_branch']
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
                url: 'git@github.com:process-engine-pro/ci-test.git'
              ]
            ]
          ]);
          sshagent(['ci-process-engine_ssh_key']) {
            sh('bash build_prod.sh')
            sh('git status')
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
