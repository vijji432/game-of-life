pipeline { 
    agent any 
        stages { 
		    stage('build') {
		        steps {
	                sh 'mvn clean install'
		        }
		    }	
    	    
			stage('SonarQube analysis') {
                steps {
				    withSonarQubeEnv(credentialsId: 'jen-son', installationName: 'sonarqub') { // You can override the credential to be used
                    sh 'mvn sonar:sonar'
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
			
            
        }
		
}
