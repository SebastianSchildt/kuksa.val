node('docker') {
    checkout scm
    stage('Build') {
        docker.image('ubuntu:bionic').inside(" -v /var/run/docker.sock:/var/run/docker.sock " ){
            sh 'ls'
            sh 'pwd'
            sh './docker/build.sh amd64'
        }
    }
}
