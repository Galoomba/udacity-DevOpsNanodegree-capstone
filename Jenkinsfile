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

         stage('Set kubectl cluster') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-cre') {
					sh '''
						kubectl config use-context arn:aws:eks:us-east-1:134672071065:cluster/mcluster
					'''
				}
			}
		}

        stage('Deploy blue container') {
			steps {
				withAWS(region:'us-east-1', credentials:'aws-cre') {
					sh '''
						kubectl apply -f ./blue-deployment.json
					'''
				}
			}
		}

     }
}