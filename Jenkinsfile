pipeline {
    
    agent {
        node {
            label 'DevSecOps' 
        }
    }

    stages {
        stage('Veracode Upload and Scan'){ 
                steps{
                        script{
                            sh 'zip -r -qq veracode.zip . -x *.git'
                    }
                withCredentials([usernamePassword(credentialsId: 'veracode-credentials', passwordVariable: 'veracode_key', usernameVariable: 'veracode_id')]) 
                    {
                        veracode applicationName:'DVPWA', debug: true, criticality: 'High', scanName: env.BUILD_NUMBER, canFailJob: true , timeout: 60, fileNamePattern: '', pHost: 'proxy.room101.com', pPassword: '', pPort: '8080', pUser: '', sandboxName: '', replacementPattern: '', scanExcludesPattern: '', scanIncludesPattern: '', teams: '', uploadExcludesPattern: '', uploadIncludesPattern: "veracode.zip", useIDkey: true, useProxy: true, vid: veracode_id, vkey: veracode_key, vpassword: '', vuser: '', waitForScan: true
                    }
                }
        }
    }
    
} 

