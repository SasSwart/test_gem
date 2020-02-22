pipeline {
  agent any
  stages {
    stage('Pull Repository') {
      steps {
        cleanWs()
        checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'cd-deploy-key', url: 'https://github.com/SasSwart/cd']]])
      }
    }
    stage('Build Gem') {
      sh 'gem build *.gemspec'
    }
  }
  parameters {
    string(name: 'repo_https', description: 'The HTTPS url of the repository for which you would like to build a gem', defaultValue: 'https://github.com/SasSwart/cd')
    string(name: 'tag', description: 'The tag from which you would like to build the gem', defaultValue: '0.0.3')
  }
}