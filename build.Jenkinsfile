pipeline {
   agent any
   stages {
      stage('Initializing GIT Submodules') {
         steps {
            sh '''
               git submodule init
               git submodule update
            '''
         }
      }
      stage('Building Latest') {
         when { expression { GIT_BRANCH == 'origin/main' } }
         steps {
            sh '''
               docker build -f db.Dockerfile -t xi-db:main .
               docker build --build-arg num_jobs=2 -f xi.Dockerfile --target run-time -t xi-run-time:main .
               docker system prune
            '''
         }
      }
      stage('Building a Tagged Release') {
         when { buildingTag() }
         steps {
            sh '''
               docker build --build-arg num_jobs=2 -f xi.Dockerfile --target run-time -t xi-run-time:${GIT_BRANCH}
               docker system prune
            '''
         }
      }
   }
}