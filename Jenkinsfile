pipeline {
    agent any

    stages {
	stage('SetupBuilder'){
	    steps {
		echo 'Pre build setup..'
                sh './setup.sh'
		}
	}
	stage('Prebuild') {
	  steps {
		git(
    		url: "git@github.com:valiknvk/jekyllSite.git",
    		branch: "main",
    		credentialsId: "f117fbd7-0c99-4a6c-8a57-fd14e7f24462",
    		changelog: true,
    		poll: true
		)
	  }
	}
        stage('Build') {
            steps {
                echo 'Building..'
		sh '''
  			ls -lsa
     			cd nginx_html_nix
		    	/nix/var/nix/profiles/default/bin/nix build
		    '''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
		sh '''
			docker load -i result
   			docker-compose up -d
      			curl localhost:8000/health
	 		docker-compose down
    		'''
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
