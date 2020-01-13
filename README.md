# simple-demo
The simple demo to copy aws secrets from secret manager to different region. 
# folders structure
* jenkinsfiles - example of simple jenkinsfile
* seedfiles    - example of simple seed file to create jenkins job
* terraform    contain terraffiles and configuration files for local testing
  - copy-secrets - example terraform using terraform module
  - moduleas - contain  module copy-create-secret-from-region

# Info how to use example
* prerequisite
 - download and install terraform >= 0.12
 - update properties in createenvproperties.bat in accordance your environment
 - create sercet information in your region from and puts the name to m_secret_name in module = demo-copy-secrets 

* run example
  - go to the copy-secrets directory
  - run createenvproperties.bat
  - run terraform init
  - run terraform plan - to check aws resources to be created
  - run terraform apply


* Notice
  This demo was originally based on terraform 11. There was not possible to use loop in the module.
  The new version 0.12 should support it. TODO spike how to inplement loop in terraform module.

  List of secrets names can be retrieved by aws CLI e.g. aws secretsmanager list-secrets > secrets.json and parsed from file to 
  terraform env property as list via e.g groovy:
  ```hcl
  def jsonSlurper = new JsonSlurper()
    def reader = new BufferedReader(new InputStreamReader(new FileInputStream("secrets.json"),"UTF-8"))
    data = jsonSlurper.parse(reader)  
    data.SecretList.each { print  it.'Name' + ',' }
  ```  