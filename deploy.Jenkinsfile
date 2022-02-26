pipeline {
   agent any
   stages {
      stage('Build and Init the Submodules') {
         steps {
            sh '''
               git submodule init
               git submodule update
               docker build -f db.Dockerfile -t xi-db:main .
               docker build --build-arg num_jobs=$(nproc) -f xi.Dockerfile --target run-time -t xi-run-time:main .
            '''
         }
      }
      stage('Deploying Server') {
         steps {
            withEnv(['DB_MOUNT=/var/dbs/reborn',
                     'DB_BACKUP=/var/db_backups/reborn',
                     'DB_NAME=xidb']) {
                withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
                    sh 'docker-compose -f docker-compose-xi.yml -p rebirthxireborn up -d'
                }
            }
         }
      }
   }
}