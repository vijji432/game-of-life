def call(body) {
def config = [:]
body.resolveStrategy = Closure.DELEGATE_FIRST
body.delegate = config
body()
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
    				    def server = Artifactory.server 'artifactory', credentialsId: 'jen-art' 
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
}
