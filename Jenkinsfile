node{
   stage('SCM Checkout'){
     git 'https://github.com/kishorsg/cicdpipeline'
   }
   stage('Compile-Package'){
      // Get maven home path
     def mvnHome =  tool name: 'maven', type: 'maven'   
      sh "${mvnHome}/bin/mvn clean package"
   }
   
  /* stage('SonarQube Analysis') {
       def mvnHome =  tool name: 'maven', type: 'maven'
        withSonarQubeEnv('sonar') { 
        sh "${mvnHome}/bin/mvn sonar:sonar"
       }
  }
   //stage ('TestNG result'){
    
    //sh "[$class : 'Publisher', reportFilenamePattern : '**/testng-result.xml']"
 // }
   
   /*stage ('Build Docker Image') {
    sh 'docker build -t kishorsg/my-app:2.0.0 .'
  }
   
   stage('Push Docker image'){
   withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
   sh "docker login -u kishorsg -p ${dockerHubPwd}"
}
  
   sh 'docker push kishorsg/my-app:2.0.0'
   }
   
   //stage ('Deploy Pod to Kubernetes Cluster'){
   //kubernetesDeploy configs: "deployment.yml", kubeconfigId: 'minikubecluster'
    
                		//kubernetesDeploy(
                    		//	kubeconfigId: 'minikubecluster',
                    			//configs: 'deployment.yml'
                		//)
            		
  // } */
  
  stage ('Deploy Pod to Kubernetes Cluster'){
          
    //	 kubernetesDeploy(configs: 'dep.yml',kubeconfigId: 'kubernetes',enableConfigSubstitution: true)
               		
            		
   //}
   
   withKubeConfig(credentialsId: 'katacoda') {
    sh 'kubectl apply -f deployment.yml'
}
  
 }
}
