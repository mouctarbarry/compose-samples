pipeline {
  agent {label 'aws'}

  environment {
    S3_BUCKET = 'results-dir'
    FILE_NAME = 'output.txt'
    ENDPOINT_URL = 'https://smoamvschxoeagqhkhcn.supabase.co/storage/v1/s3'
  }

  stages {
    stage('Create Text File') {
      steps {
        script {
          writeFile file: "${env.FILE_NAME}", text: 'This is a sample text file.'
        }
        echo "File ${env.FILE_NAME} created."
      }
    }
    stage('Upload to S3') {
      steps {
        withVault(
          vaultSecrets: [
            [path: 'jenkins/s3', secretValues: [
              [envVar: 'AWS_ACCESS_KEY_ID', vaultKey: 'access_key_id'],
              [envVar: 'AWS_SECRET_ACCESS_KEY', vaultKey: 'secret_access_key']
            ]]
          ]
        ) {
          sh "aws s3 cp ${env.FILE_NAME} s3://${env.S3_BUCKET} --endpoint-url ${env.ENDPOINT_URL}"
          echo "File uploaded to S3 bucket: ${env.S3_BUCKET}"
        }
      }
    }
  }
}
