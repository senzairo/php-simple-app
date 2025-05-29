pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/senzairo/php-simple-app.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'composer install'
            }
        }
        stage('Run Unit Tests') {
            steps {
                sh 'vendor/bin/phpunit tests'
            }
        }
        stage('Docker Build and Run') {
            steps {
                sh 'docker build -t php-simple-app .'
                sh 'docker run -d -p 8080:80 php-simple-app'
            }
        }
    }
}
