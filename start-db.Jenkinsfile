pipeline {
   agent any
   stages {
      stage('Build latest Docker DB Image') {
         steps {
            sh '''
               docker build -f db.Dockerfile -t xi-db:main .
            '''
         }
      }
      stage('Deploying Database') {
         steps {
            withEnv(['DB_MOUNT=/var/dbs/reborn',
                     'DB_BACKUP=/var/db_backups/reborn',
                     'DB_NAME=xidb']) {
                withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
                    sh 'docker-compose -f docker-compose-db.yml -p rebirthxireborn up -d'
                }
            }
         }
      }
   }
}