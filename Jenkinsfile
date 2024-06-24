pipeline {
    agent any

    stages {
	stage('SetupBuilder'){
	    steps {
		echo 'Pre build setup..'
		./setup.sh
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
