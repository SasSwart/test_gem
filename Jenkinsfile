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
      steps {
        sh 'gem build *.gemspec'
      }
    }
    stage('Upload Gem') {
      steps {
        sh 'scp *.gem geminabox:/var/geminabox-data/gems'
        sh 'ssh root@geminabox gem generate_index -d /var/geminabox-data/'
        cleanWs()
      }
    }
  }
  parameters {
    string(name: 'repo_https', description: 'The HTTPS url of the repository for which you would like to build a gem', defaultValue: 'https://github.com/SasSwart/cd')
  }
}