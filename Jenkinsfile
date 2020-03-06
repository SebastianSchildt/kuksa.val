node('docker') {
    checkout scm
    stage('Build') {
		def buildImage = docker.build("my-image:${env.BUILD_ID}", "-f docker/Dockerfile-Jenkins-Build-Env .")
        buildImage.inside(" -v /var/run/docker.sock:/var/run/docker.sock " ){
			sh '''
			 # need this to use host docker. putting it in the correct group with correct gid doesn't help
             # but strangely this works. Don't try at home
            sudo chmod ugo+rwx /var/run/docker.sock
            ls
            pwd
            ./docker/build.sh amd64
            '''
        }
    }
}

