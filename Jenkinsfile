// Configurable values
// -------------------

// SonarQube Host URL
def SONAR_HOST = 'http://sonarqube:9000'

// Who is allowed to promote for a release? (comma separated, no blanks!)
def RELEASE_PROMOTERS = 'karthik'

// Timeouts how long the individual stages might take before they fail
def timeouts = [
	unit: 'MINUTES',
	preparation: 2,
	compile: 2,
	munit: 5,
	sonarcube: 5,
	regression: 1,
	deploy: 2,
]
def GITUSER = credentials('karthik')
	
node {
	
	try {
	stage "Prepare and SCM"
		sh 'git config --global user.name "vijji432"'
    		sh 'git config --global user.email karthikyadav772@gmail.com'
		sh 'git config --global push.default simple'

      		// Cleanup local checkout - TODO there should also be a dedicated jenkins command to invoke this action
    		deleteDir()
		git branch: 'dev', credentialsId: 'karthik', url: 'https://github.com/vijji432/game-of-life.git'
    		// Clone from git
    		checkout scm
    
    	stage 'Set Version'
    		def originalV = version();
    		def major = originalV[0];
    		def minor = originalV[1];
    		def v = "${major}.${minor}-${env.BUILD_NUMBER}"
    		if (v) {
       			echo "Building version ${v}"
    		}
    		sh "/opt/maven/bin/mvn -B versions:set -DgenerateBackupPoms=false -DnewVersion=${v}"
	
		// Add the pom.xml files and create a commit+tag
		sh "git config --global user.name 'vijji432'"
    		sh 'git add .'
    		sh "git commit -m 'Raise version'"
    		sh "git tag v${v}"
		withCredentials([usernamePassword(credentialsId: 'karthik', passwordVariable: 'Surabhi@12', usernameVariable: 'vijji432')]) {
 		   sh "git remote set-url origin https://github.com/vijji432/game-of-life.git"	
		   sh "git tag -a some_tag -m 'Jenkins'"
    		   sh 'git push origin HEAD:dev --tags'
}
	
    stage 'Build'
         	sh '/opt/maven/bin/mvn clean install -DskipTests -U' 
	
    stage 'Test'
		 stage 'mUnit' 
			// We have no regression tests yet
			sh 'echo Test'
		stage 'postman'
			sh ' echo postman'
			// need npm package - newman to run them
			 
    		
    stage 'SonarQube'
			sh 'echo Sonar'
			/* timeout (time: timeouts.sonarcube, unit: timeouts.unit) {
			// maven sonar plugin requires java 8!
			withEnv(["JAVA_HOME=${tool 'JDK8'}"]) {
			sh "mvn -B -s $MVN_SETTINGS -gs $MVN_SETTINGS sonar:sonar -Denforcer.skip -Dsonar.host.url=$SONAR_HOST"
				}
			} */
	
    stage 'Deploy'
      		echo 'Push to Artifactory Repo'
		// Blue - Green deploy strategy needed
     
    stage 'Cleanup'
        	deleteDir()
      		echo 'prune and cleanup'
      		// echo sh(returnStdout: true, script: 'env')

      
     		mail from: 'jenkins@localhost',
        		replyTo: 'build@localhost',
        		subject: "${env.JOB_NAME}-${env.BUILD_NUMBER} build successful",
        		to: "srinivasa.pashupathi@gmail.com",
			body: "${env.JOB_NAME}-${env.BUILD_NUMBER} build successful, Please go to ${env.BUILD_URL}."
		}

  catch (err) {
    		currentBuild.result = "FAILURE"

   
    		mail from: 'jenkins@localhost',
      			replyTo: 'build@localhost',
      			subject: "${env.JOB_NAME}-${env.BUILD_NUMBER} build failed",
      			to: "srinivasa.pashupathi@gmail.com",
      			body: "${env.JOB_NAME}-${env.BUILD_NUMBER} build error is here: ${env.BUILD_URL}, Please go to ${env.BUILD_URL}." 
      throw err
    
  }
}
	// Parse the pom.xml and extract the version information.
def version() {
    	def matcher = readFile('pom.xml') =~ '<version>(.+)-.*</version>'
    	matcher ? matcher[0][1].tokenize(".") : null
}
