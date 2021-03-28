pipeline { 

    environment { 

        registry = "kardock/gameoflife

        registryCredential = 'dockerhub' 

        dockerImage = '' 

    }

    agent any 


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
