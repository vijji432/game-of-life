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
				    script {
    			 def server = Artifactory.newServer url: 'http://35.237.118.69:8082/artifactory', credentialsId: 'jen-art'	  
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

