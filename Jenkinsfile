pipeline { 
    
	agent any 
	
		stages {
		    
			#stage('build') {
			
			 #   steps {
				    
			#		sh 'mvn clean install'
			#	}	
         
     		#}      
            #stage('docker build') {
			    
			#	steps {
				 
			#	    sh 'docker build -t 
					
	    stage('Publish') {
            environment {
                registryCredential = 'dock'
            }
            steps{
                script {
                    def appimage = docker.build registry + ":$BUILD_NUMBER"
                    docker.withRegistry( '', registryCredential ) {
                        appimage.push()
                        appimage.push('latest')
                    }
                }
            }
        }
		} 
		
    }
