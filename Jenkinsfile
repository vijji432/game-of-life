pipeline {
    agent any
	environment {
	    def server = Artifactory.server 'artifactory', credentialsId: 'jen-art'
	    stages {
		    stage('build') {
			    steps {
				    sh 'mvn clean install'
				}
			}
            stage('artifactory') {
                steps {
				    script {
    				  
                        def uploadSpec = """{
                          "files": [
                            {
                              "pattern": "**/*.war",
                              "target": "libs-release/"
                            }
                         ]
					
                        }"""
					    
                        server.upload spec: uploadSpec
					    rtPublishBuildInfo (
                            serverId: 'artifactory'
					    )
                    }						
                }
			}
		}	
} 

