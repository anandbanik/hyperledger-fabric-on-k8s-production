https://github.com/foremast/foremast
https://tech.gogoair.com/foremast-automate-spinnaker-pipeline-creation-2b2aa7b2c5e4#.qplfw19cg

Spinnaker pipeline and infrastructure configuration and templating tool - Pipelines as Code. https://foremast.readthedocs.io/

PRE-Requisites: Python3, Pip3, Virtual Environment
```
$ sudo apt-get install pip3
$ sudo apt-get update
$ sudo apt-get -y install python3-pip
$ pip3 install virtualenv
$ sudo apt install virtualenvvirtualenv -p $(which python3) venv
$ source venv/bin/activate
```
Installation
Setting up the environment


````
$ pip3 install virtualenv
$ virtualenv -p $(which python3) venv
$ source venv/bin/activate
$ pip install foremast
````


Create Configuration files

````
$ mkdir runway .foremast
````
Create pipeline.json in runway directory
````
vi runway/application-master-dev.json
````

runway/pipeline.json
````
{
   "deployment": "spinnaker",
   "env": [ "dev"]
}
````

.foremast/foremast.cfg

````
[base]
domain = example.com
envs = dev,prod
regions = us-east-1
gate_api_url = http://10.24.xxx.xxx:8084

````

Now from within the root directory, RUN

````
GIT_REPO=hello PROJECT=world RUNWAY_DIR=runway/ foremast-pipeline
````
 

This will create an application in Spinnaker named helloworld along with a simple pipeline.