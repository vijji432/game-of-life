pipeline {
    agent any
        stages {
	        stage('build') {
	            steps {
	                sh 'mvn clean install'
		        }
	        }
            stage ('Artifactory configuration') {
        // Obtain an Artifactory server instance, defined in Jenkins --> Manage:
		        steps {
			        script {
                        def server = Artifactory.newServer url: 'http://localhost:8081/artifactory', username: 'admin', password: 'Art1factoryadmin'
                        def rtMaven = Artifactory.newMavenBuild()
                        rtMaven.tool = 'maven' // Tool name from Jenkins configuration
                        rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
                        rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
                        rtMaven.deployer.deployArtifacts = false // Disable artifacts deployment during Maven run

                        buildInfo  = Artifactory.newBuildInfo()
                    }
		        }
	        }
          
 
            stage ('Deploy') {
			    steps {
				    script {
                        rtMaven.deployer.deployArtifacts buildInfo
                    }  
                }
			}	
            stage ('Publish build info') {
			    steps {
				    script {
                        server.publishBuildInfo buildInfo
                    }
				}
			}	
        }
		
}

