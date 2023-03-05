pipeline {
    
  agent {

  docker {
      image 'pwrppll/build-container'
    }
    
  }
    
  stages {

    stage('Copy project') {
      steps {
        git branch: 'jetty-10.0.x', url: 'https://github.com/jetty-project/embedded-jetty-live-war.git'
      }
    }

    stage('Build war') {
      steps {
       sh 'cd ./embedded-jetty-live-war' 
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
        sh 'docker login -u -p && docker push devcvs-srv01:5000/shop2-backend/gateway-api:2-staging'
      }
    }  
  }
}