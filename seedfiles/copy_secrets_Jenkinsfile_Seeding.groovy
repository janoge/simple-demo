secretsRepository = "git@github.com:janoge/simple-demo.git"

pipelineJob('DEMO-copy-secrets-from-region') {
    properties {
        description('DEMO copy the SecretManager secrets from one region to another.')
        disableConcurrentBuilds()  
  }
    parameters {
        choice{
            name('environment')
            choices(['playground'])
            description('Select target environment: Playground, ...')
        }
        choice{
            name('region')
            choices(['eu-west-2','eu-west-1','eu-central-1','eu-west-3','us-east-1'])
            description('please, do not change order of region! eu-central-1(Frankfurt),eu-west-2(London),eu-west-1(Ireland),eu-west-3(France),us-east-1(N. Virginia)')
        }
        choice{
            name('region_from')
            choices(['eu-west-1','eu-central-1','eu-west-2','us-east-1'])
            description('eu-central-1(Frankfurt),eu-west-2(London),eu-west-1(Ireland),us-east-1(N. Virginia)')
        }

        gitParameter{
            name('branch_name')
            description('The branch containing the deployment pipeline script.')
            type('PT_BRANCH')
            defaultValue('origin')
            branch('')
            branchFilter('.*')
            tagFilter('*')
            sortMode('NONE')
            selectedValue('NONE')
            useRepository('')
            quickFilterEnabled(false)
            listSize('5')
       }

    }

    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url(secretsRepository)
                    }
                    branches('${branch_name}')

                    extensions {                                                                                        
                        checkoutOption {
                            timeout(2)
                        }
                        cleanBeforeCheckout()                                  
                    }
                }
            }
            scriptPath("jenkinsfiles/Jenkinsfile")
            lightweight(false)
        }
    }
}

