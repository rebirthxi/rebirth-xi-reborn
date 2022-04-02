pipeline {
   agent any
   environment {
      DB_MOUNT="/var/dbs/reborn"
      DB_BACKUP="/var/db_backups/reborn"
      DB_NAME="xidb"
      CONTAINER="rebirthxireborn-xidb-1"
   }
   stages {
      stage('Loading Updates to Static Database Data') {
         steps {
            withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
               sh 'python3 tools/db_update.py'
            }
         }
      }
      stage('Loading Updates to Dynamic Character Database Data') {
         steps {
            withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
               sh 'docker exec -e DB_USER=$DB_USER -e DB_USER_PASSWD=$DB_USER_PASSWD -e DB_NAME=$DB_NAME -i $CONTAINER python3 migrate.py'
           }
        }
     }
   }
}