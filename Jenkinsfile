pipeline {
    agent any

    parameters {
        booleanParam(
            name: 'ENABLE_DEBUG',
            defaultValue: false,
            description: 'Enable SSH debugging session'
        )
    }

    environment {
        DOCKER_HOST = "tcp://192.168.1.39:2375"
        IMAGE_NAME = "jenkins-debug-image"
        CONTAINER_NAME = "jenkins-debug-container"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh '''
                docker -H $DOCKER_HOST build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Start Container') {
            steps {
                sh '''
                docker -H $DOCKER_HOST run -d \
                --name $CONTAINER_NAME \
                $IMAGE_NAME sleep infinity
                '''
            }
        }

        stage('Enable SSH Debug') {
            when {
                expression { params.ENABLE_DEBUG }
            }

            steps {
                sh '''
                docker -H $DOCKER_HOST exec $CONTAINER_NAME \
                /scripts/start_tmate_debug.sh
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                docker -H $DOCKER_HOST exec $CONTAINER_NAME \
                python /app/test_main.py
                '''
            }
        }

    }

    post {
        always {
            sh '''
            docker -H $DOCKER_HOST rm -f $CONTAINER_NAME || true
            '''
        }
    }
}
