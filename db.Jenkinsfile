pipeline {
   agent any
   environment {
      DB_MOUNT="/var/dbs/reborn"
      DB_BACKUP="/var/db_backups/reborn"
      DB_NAME="xidb"
      CONTAINER="rebirthxireborn-xidb-1"
   }
   stages {
      stage('Start DB') {
         steps {
            withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
               sh '''
                  docker-compose -f docker-compose-xi.yml -p rebirthxireborn up -d xidb
                  sleep 15
               '''
            }
         }
      }
      stage('Loading Static Data') {
         steps {
            withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
               sh 'python3 tools/db_update.py'
           }
        }
     }
     stage('Shutting down DB')
     {
        steps {
           sh 'docker-compose -f docker-compose-xi.yml -p rebirthxireborn down'
        }
     }
   }
}