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
                    nexusPublisher nexusInstanceId: 'nexus', nexusRepositoryId: 'maven-releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: 'clean install ', extension: 'true', filePath: '~/.m2']], mavenCoordinate: [artifactId: 'gameoflife', groupId: 'com.wakaleo.gameoflife', packaging: 'pom', version: '1.0-SNAPSHOT']]], tagName: 'v1'
                }
            }
        }
    }
}
