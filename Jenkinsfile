pipeline {
    agent any
        stages {
	    stage('build') {
	        steps {
	            sh 'mvn clean install'
		}
	    }
            stage('Publish') {
		    steps {
			script {			    
                            def server = Artifactory.server 'artifactory'
                            def rtMaven = Artifactory.newMavenBuild()
                            rtMaven.tool = 'maven'
                            rtMaven.deployer server: server, releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local'
                            rtMaven.deployer.artifactDeploymentPatterns.addInclude("**/*.war")
                         
                            )
			}
		    }	    
            }
          }
}
