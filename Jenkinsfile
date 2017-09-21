node {
	
try {

    stage 'Checkout'
    sh 'echo checking out'
    checkout scm

    stage 'Build'
      sh "git tag -a ${env.BUILD_TAG} -m 'Jenkins Build Tag ${env.BUILD_TAG}'"
      sh '/opt/maven/bin/mvn clean install -DskipTests -U'
      sh 'git push origin dev --tags'
      
    stage 'Test'
      sh 'echo test'
	
    stage 'Deploy'

      echo 'Push to Repo'
     
    stage 'Cleanup'
        deleteDir()
      echo 'prune and cleanup'
      // echo sh(returnStdout: true, script: 'env')

      
      mail body: "${env.JOB_NAME}-${env.BUILD_NUMBER} build successful, Please go to ${env.BUILD_URL}.",
        from: 'build@localhost',
        replyTo: 'build@localhost',
        subject: "${env.JOB_NAME}-${env.BUILD_NUMBER} build successful",
        to: "srinivasa.pashupathi@gmail.com"
		}

  catch (err) {
    currentBuild.result = "FAILURE"

   
    mail body: "${env.JOB_NAME}-${env.BUILD_NUMBER} build error is here: ${env.BUILD_URL}, Please go to ${env.BUILD_URL}." ,
      from: 'build@localhost',
      replyTo: 'build@localhost',
      subject: "${env.JOB_NAME}-${env.BUILD_NUMBER} build failed",
      to: "srinivasa.pashupathi@gmail.com"
      throw err
    
  }
}
