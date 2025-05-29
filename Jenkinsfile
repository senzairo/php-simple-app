pipeline {
    agent any

    environment {
        COMPOSER_ALLOW_SUPERUSER = "1"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/senzairo/php-simple-app.git'
            }
        }

        stage('Install Composer') {
            steps {
                sh 'curl -sS https://getcomposer.org/installer | php'
                sh 'sudo mv composer.phar /usr/local/bin/composer || mv composer.phar /usr/local/bin/composer'
                sh 'composer --version'
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
