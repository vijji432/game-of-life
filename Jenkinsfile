pipeline {
    agent any 
	
   
    stages {
        
        stage("Maven Build") {
            steps {
                script {
                    sh "mvn clean install"
                }
            }
        }
        stage("Publish to Nexus Repository Manager") {
            steps {
                script {
                    nexusArtifactUploader artifacts: [[artifactId: 'gameoflife', classifier: '', file: 'gameoflfe-web/target/gameoflife.war', type: 'war']], credentialsId: 'je-ne', groupId: 'com.wakaleo.gameoflife', nexusUrl: '35.243.158.65:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: '1.0.0'
                }
            }
        }
        stage('test') {
		    steps {
			    sh 'mvn test'
			}
			post {
                always {
                    junit '**/target/surefire-reports/TEST-*.xml'
				}
			}
        }			
		stage('Results') {
            junit '**/target/surefire-reports/TEST-*.xml'
            archive 'target/*.war'
		}
    }
}
	

