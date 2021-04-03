pipeline { 

    environment { 

   
	

    agent any 
        stages { 
		stage('build') {
		    steps {
	                sh 'mvn clean install'
		    }
		}	
	         stage('Code Quality Check via SonarQube') {
                     steps {
                         script {
                             def scannerHome = tool 'sonarqube-scanner';
                                 withSonarQubeEnv(installationName: 'Sonarqub', credentialsId: 'jen-son')  {
                                 sh "${tool("sonarqube-scanner")}/bin/sonar-scanner \
                                -Dsonar.organistaion=Org-name \
                                -Dsonar.projectKey=project-name \
                                -Dsonar.sources=. \
                                 }
                         }
                     }
                 }
stage("Quality Gate") {
  steps {
    timeout(time: 1, unit: 'MINUTES') {
        waitForQualityGate abortPipeline: true
    }
  }
}
