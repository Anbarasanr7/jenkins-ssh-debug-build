pipeline {
    agent any

    parameters {
        choice(
            name: 'DEBUG_MODE',
            choices: ['NONE', 'TMATE', 'DIRECT_SSHD'],
            description: 'Enable debug mode'
        )
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("jenkins-debug-image")
                }
            }
        }

        stage('Run Build Container') {
            steps {
                script {

                    docker.image("jenkins-debug-image").inside {

                        if (params.DEBUG_MODE == "TMATE") {
                            sh "bash scripts/start_tmate_debug.sh"
                        }

                        if (params.DEBUG_MODE == "DIRECT_SSHD") {
                            sh "bash scripts/start_direct_sshd_debug.sh"
                        }

                        sh "python app/main.py"
                        sh "python -m pytest app/test_main.py"
                    }
                }
            }
        }
    }
}
