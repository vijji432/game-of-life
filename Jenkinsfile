pipeline {
    agent any
	    stages {
		    stage('build') {
			    steps {
				    sh 'mvn clean install'
				}
			}
            stage('artifactory') {
                steps {
			server = Artifactory.server 'artifactory', credentialsId: 'jen-art' {
                     uploadSpec = """{
                      "files": [
                        {
                          "pattern": "**/*.war",
                          "target": "libs-release/"
                        }
                     ]
		     
                    }"""
			}	
                    server.upload spec: uploadSpec
					rtPublishBuildInfo (
                        serverId: 'artifactory'
					)	
                }
			}
		}	
}
