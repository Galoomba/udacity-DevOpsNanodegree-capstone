pipeline {
     agent any
     stages {
        stage('Lint') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}
         stage('Build and push to dockerhub ') {
             steps {
                 withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker build -t $DOCKER_USERNAME/capstone .
                        docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push $DOCKER_USERNAME/capstone
					'''
                }
             }
         }
     }
}