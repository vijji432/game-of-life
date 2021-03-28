pipeline { 

    environment { 

        registry = "kardock/gameoflife"

        registryCredential = 'dockerhub' 

        dockerImage = '' 

    }

    agent any 
    stages {

        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 
            }

        } 
		stage('upload to aws_bucket) {
		    
			steps {
			    withAWS(region:'ap-south-1',credentials:'jen-s3')
                s3Upload(bucket:"my-bucket", path:'/var/lib/jenkins/workspace/gameoflife/', includePathPattern:'**/*.war')
			}
		}	
    }
}
