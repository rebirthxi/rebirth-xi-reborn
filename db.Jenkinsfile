pipeline {
   agent any
   environment {
      DB_MOUNT="/var/dbs/reborn"
      DB_BACKUP="/var/db_backups/reborn"
   }
   stages {
      stage('Start DB') {
         steps {
            withEnv(['DB_MOUNT=/var/dbs/reborn',
                     'DB_BACKUP=/var/db_backups/reborn',
                     'DB_NAME=xidb']) {
                withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
                    sh '''
                       docker-compose -f docker-compose-xi.yml -p rebirthxireborn up -d xidb
                       sleep 15
                    '''
                }
            }
        }
     }
     stage('Loading Static Data') {
        steps {
           withCredentials([usernamePassword(credentialsId:'reborn-db', usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
              sh '''
                 docker exec -i rebirthxireborn-xidb-1 sh -c "mysql -u ${DB_USER} -p${DB_USER_PASSWD} xidb" < sql/qr_sql/status_effects.sql
                 docker exec -i rebirthxireborn-xidb-1 sh -c "mysql -u ${DB_USER} -p${DB_USER_PASSWD} xidb" < sql/qr_sql/black_mage_time_machine.sql
                 docker exec -i rebirthxireborn-xidb-1 sh -c "mysql -u ${DB_USER} -p${DB_USER_PASSWD} xidb" < sql/qr_sql/char_distribute_xp.sql
                 docker exec -i rebirthxireborn-xidb-1 sh -c "mysql -u ${DB_USER} -p${DB_USER_PASSWD} xidb" < sql/qr_sql/artifact_changes.sql
                 docker exec -i rebirthxireborn-xidb-1 sh -c "mysql -u ${DB_USER} -p${DB_USER_PASSWD} xidb" < sql/qr_sql/nexus_cape.sql
                 docker exec -i rebirthxireborn-xidb-1 sh -c "mysql -u ${DB_USER} -p${DB_USER_PASSWD} xidb" < sql/qr_sql/helm_gear_mods.sql
              '''
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