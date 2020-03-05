node('docker') {
    checkout scm
    stage('Build') {
		def buildImage = docker.build("my-image:${env.BUILD_ID}", "-f docker/Dockerfile-Jenkins-Build-Env .")
        buildImage.inside(" -v /var/run/docker.sock:/var/run/docker.sock " ){
            sh 'ls'
            sh 'pwd'
            sh './docker/build.sh amd64'
        }
    }
}

Dockerfile-Jenkins-Build-Env
