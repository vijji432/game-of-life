pipeline {
    agent any 
	
    def server
    def buildInfo
    def rtMaven
	stages {
            stage ('Artifactory configuration') {
        // Obtain an Artifactory server instance, defined in Jenkins --> Manage:
                server = Artifactory.newServer url: 'http://localhost:8081/artifactory', username: 'admin', password: 'password'
                rtMaven = Artifactory.newMavenBuild()
                rtMaven.tool = 'mvn' // Tool name from Jenkins configuration
                rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
                rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
                rtMaven.deployer.deployArtifacts = false // Disable artifacts deployment during Maven run
                buildInfo = Artifactory.newBuildInfo()
            }
 
            stage ('Test') {
                rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean test'
            }
        
            stage ('Install') {
                rtMaven.run pom: 'maven-example/pom.xml', goals: 'install', buildInfo: buildInfo
            }
 
            stage ('Deploy') {
                rtMaven.deployer.deployArtifacts buildInfo
            }
        
            stage ('Publish build info') {
                server.publishBuildInfo buildInfo
            }
   }
}
