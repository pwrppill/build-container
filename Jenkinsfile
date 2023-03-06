pipeline {
    
  agent {

  docker {
      image 'pwrppill/build-container'
      args '--privileged -v /var/run/docker.sock:/var/run/docker.sock -v /root:/root -u root'
    }
    
  }
    
  stages {

    stage('Copy project') {
      steps {
        git branch: 'main', url: 'https://github.com/pwrppill/build-container.git'
      }
    }

    stage('Build war') {
      steps {
       sh 'mvn package'
      }
    }

    stage('Make docker image') {
      steps {
        sh 'docker build -t embedded-jetty-live-war .'
      }
    }

    stage('tag docker image') {
      steps {
        sh 'docker tag embedded-jetty-live-war pwrppill/embedded-jetty-live-war'     
      }  
    }   
    
    stage('push docker image to registry') {
      steps {
        sh 'docker push pwrppill/embedded-jetty-live-war'
      }
    }
    
    stage('Pull & deploy app') {
        steps {
            sh 'ssh-keyscan -H 158.160.28.155 >> ~/.ssh/known_hosts'
            sh 'ssh root@158.160.28.155 << EOF'
            sh 'docker pull pwrppill/embedded-jetty-live-war'
            sh 'docker run -p 8081:8080 -d pwrppill/embedded-jetty-live-war'
        }
    }
  }
}