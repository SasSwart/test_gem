pipeline {
  agent any
  stages {
    stage('Pull Repository') {
      steps {
        cleanWs()
        checkout scm: 
        [$class: 'GitSCM', userRemoteConfigs: [[url: params.repo_https, credentialsId: 'sas-github']], branches: [[name: params.tag]]],poll: false
      }
    }
  }
  parameters {
    string(name: 'repo_https', description: 'The HTTPS url of the repository for which you would like to build a gem')
    string(name: 'tag', description: 'The tag from which you would like to build the gem')
  }
}