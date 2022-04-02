pipeline {
   agent any
   stages {
      stage('Shutting down Database') {
         steps {
            withEnv(['DB_MOUNT=/var/dbs/reborn',
                     'DB_BACKUP=/var/db_backups/reborn',
                     'DB_NAME=xidb']) {
                withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
                    sh 'docker-compose -f docker-compose-db.yml -p rebirthxireborn down'
                }
            }
         }
      }
   }
}