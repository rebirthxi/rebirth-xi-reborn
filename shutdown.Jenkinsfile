pipeline {
   agent any
   environment {
      DB_MOUNT="/var/dbs/reborn"
      DB_BACKUP="/var/db_backups/reborn"
      DB_NAME="xidb"
      DB_ROOT_PW="null"
      DB_USER="null"
      DB_USER_PASSWD="null"
   }
   stages {
      stage('Shutting down XI servers') {
         steps {
            sh '''
               docker-compose -f docker-compose-xi.yml -p rebirthxireborn stop xiconnect
               docker-compose -f docker-compose-xi.yml -p rebirthxireborn stop xigame
               docker-compose -f docker-compose-xi.yml -p rebirthxireborn stop xisearch
            '''
         }
      }
   }
}