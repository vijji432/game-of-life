pipeline { 

    environment { 

   
	    
	AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('secret_access_key_id')
    }  

    

    agent any 
        stages { 
		stage('build') {
		    steps {
	                sh 'mvn clean install'
		    }
		}	
	        stage('upload') {
		    
			steps {
                           sh 'aws configure set region ap-south-1'
                           sh 'aws s3 cp ./target/gameoflife-0.0.1-SNAPSHOT.jar s3://kar-buck/gameoflife.jar'			 
				// withAWS(region:'ap-south-1',credentials:'jen-s3')
                //s3Upload(bucket:"kar-buck", path:'/var/lib/jenkins/workspace/gameoflife/', includePathPattern:'**/*.war')
			}
		}	
         }
}
