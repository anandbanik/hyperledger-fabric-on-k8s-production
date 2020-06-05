pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    timestamps()
  }

  parameters {
    string(name: 'APP_NAME', defaultValue: 'none', description: '<h2>Application name to be deployed ?</h2>', trim: true)
    string(name: 'BUILD_VERSION', defaultValue: 'none', description: '<h2>Build Version to deploy ?</h2>', trim: true)
  }

  agent {
    label 'Build-Slave-1'
  }
  
  stages {

    stage('Build AMI') {
      steps {
        dir("packer_templates/application/test-application"){
          withAWS(region: 'us-east-1') {
            sh '/home/jenkins/packer build packer-production.json | tee ${WORKSPACE}/packer_output.txt'
          }
        }
        script {
          env.AMI_ID = sh(script: 'grep "us-east" packer_output.txt | grep -o "ami-[a-z0-9]*" | tr "\\n" " "', returnStdout: true)
          if (env.AMI_ID == "") {
            error("no AMI was built")
          }
        }
      }
    }

  }
  post {
    cleanup {
      sh 'rm -f packer_output.txt'
    }
  }
}