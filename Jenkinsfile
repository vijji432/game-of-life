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
                    nexusArtifactUploader artifacts: [[artifactId: 'gameoflife', classifier: 'default', file: '**/*.war', type: 'gameoflife.war']], credentialsId: 'je-ne', groupId: 'com.wakaleo.gameoflife', nexusUrl: '35.237.118.69:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: '1.0-SNAPSHOT'
                }
            }
        }
    }
}
                }
            }
        }
    }
}
