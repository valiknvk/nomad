pipeline {
    agent any

    stages {
	stage('SetupBuilder'){
	    steps {
		echo 'Pre build setup..'
                sh './setup.sh'
		}
	}
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
