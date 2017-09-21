node {
try {

    stage 'Checkout'
    sh 'echo checking out'
    checkout scm
	

    stage 'Test'
      sh 'echo test'

    stage 'Build'
      sh '/opt/maven/bin/mvn clean install -DskipTests -U'
      
    stage 'Deploy'

      echo 'Push to Repo'
     
    stage 'Cleanup'
        deleteDir()
      echo 'prune and cleanup'
      // echo sh(returnStdout: true, script: 'env')

      
      mail body: "${env.JOB_NAME}-${env.BUILD_NUMBER} build successful",
        from: 'build@localhost',
        replyTo: 'build@localhost',
        subject: "${env.JOB_NAME}-${env.BUILD_NUMBER} build successful",
        to: "srinivasa.pashupathi@gmail.com", body: "Please go to ${env.BUILD_URL}."
		}

  catch (err) {
    currentBuild.result = "FAILURE"

   
    mail body: "${env.JOB_NAME}-${env.BUILD_NUMBER} build error is here: ${env.BUILD_URL}" ,
      from: 'build@localhost',
      replyTo: 'build@localhost',
      subject: "${env.JOB_NAME}-${env.BUILD_NUMBER} build failed",
      to: "srinivasa.pashupathi@gmail.com", body: "Please go to ${env.BUILD_URL}."
      throw err
    
  }
}
