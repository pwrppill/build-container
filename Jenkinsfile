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
            sh '''ssh root@158.160.28.155 << EOF
            docker pull pwrppill/embedded-jetty-live-war
            docker run -p 8383:8080 -d pwrppill/embedded-jetty-live-war
EOF'''
        }
    }
  }
}