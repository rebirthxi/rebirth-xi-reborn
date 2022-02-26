pipeline {
   agent any
   parameters {
      string(name:"DB_MOUNT", defaultValue:"/var/dbs/reborn", description:"What is the location of the database you wish to use?")

      string(name:"DB_BACKUP", defaultValue:"/var/db_backups/reborn", description:"What is the location where the database should backup to?")

      string(name:"DB_NAME", defaultValue:"xidb", description:"What is the name of the database to perform the migration on?")

      string(name:"CREDENTIALS", defaultValue:"reborn-db", description:"What set of credentials would you like to use (from Jenkins credentials)?")

      string(name:"DB_ROOT_PW", defaultValue:"reborn-db-root-pw", description:"What secret would you like to use (from Jenkins credentials)?")
   }
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
            withEnv(['DB_MOUNT=' + params.DB_MOUNT,
                     'DB_BACKUP=' + params.DB_BACKUP,
                     'DB_NAME=' + params.DB_NAME]) {
                withCredentials([usernamePassword(credentialsId:params.CREDENTIALS, usernameVariable:'DB_USER', passwordVariable:'DB_USER_PASSWD')]) {
                    sh 'docker-compose -f docker-compose-xi.yml up -d'
                }
            }
         }
      }
   }
}