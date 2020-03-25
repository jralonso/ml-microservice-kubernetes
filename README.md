
# operationalize a Machine Learning Microservice API
[![jralonso](https://circleci.com/gh/jralonso/ml-microservice-kubernetes.svg?style=svg)](https://app.circleci.com/pipelines/github/jralonso/ml-microservice-kubernetes?branch=master)


## Project Overview

In this project you will find the tools and steps to operationalize the machine learning python microservice used in Udacity's devops cloud nanodegree. More information about the project can be found in the original [github repository](https://github.com/udacity/DevOps_Microservices/tree/master/project-ml-microservice-kubernetes).

The microservice is build as a python app and the repository includes the necessary files to run build and run the app in a docker container. 

### Project files

This is the file structure of this repository. We will explain in more detail each one of this files in the next sections.

├── app.py  
├── Dockerfile  
├── Makefile  
├── make_prediction.sh  
├── model_data  
│   ├── boston_housing_prediction.joblib  
│   └── housing.csv  
├── output_txt_files  
│   ├── docker_out.txt  
│   └── kubernetes_out.txt  
├── README.md  
├── requirements.txt  
├── run_docker.sh  
├── run_kubernetes.sh  
└── upload_docker.sh  

### The app

The python microservice is developed in _app.py_. It uses the data in the files under _model_data_ folder to be able to provide the prediction.
The auxiliary file _make_prediction.sh_ allows us to test the app easily using curl with a predefined payload json. 

### The container

The Dockerfile to build the container is provided, but you can also download the latest version of the container from [docker hub](https://hub.docker.com/repository/docker/jralonso/udacity-devops-mlproject). 

The repository also provides some auxiliary files to deal with repetitive tasks, these files can be used as a template for some other apps:
* run_docker.sh: builds and runs the docker container with the app
* upload_docker.sh: tags and pushes the container to docker hub
* run_kubernetes.sh: runs the container in kubernetes and forwards the container port 80 to host port 8000

## Build the app

### Prerequisites

* Install _hadolint_ following the instructions [here](https://github.com/hadolint/hadolint). 
* Install docker
* To run kubernetes locally you have to install Minikube which allows you to run a single-node Kubernetes cluster inside a local VM.

### Setting up the environment

For convenience we provide a _Makefile_ with instructions on environment setup and lint tests

To set up the virtual environment and installing python dependencies just run the following commands

```bash
$> make setup
$> source ~/.devops/bin/activate
$> make install
```
### Lint tests
This command will pass hadolint on the Dockerfile and pylint on the python file app.py

``` bash
$> make lint
```

### Running the application

* Standalone: 
    ```
    $> python app.py
    ```
* Run in Docker: 
    ```
    $> ./run_docker.sh
    ```
* Run in Kubernetes: 
    ```
    $> ./run_kubernetes.sh
    ```
