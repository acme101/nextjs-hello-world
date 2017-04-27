#!/bin/bash

set -e

gcloud auth activate-service-account --key-file /tmp/gcp_key_file.json
#ssh-keygen -f ~/.ssh/google_compute_engine -N ""

gcloud docker -a
#docker pull $DOCKER_IMAGE_PROD
#docker tag $DOCKER_IMAGE_PROD $GCP_IMAGE
#docker push $GCP_IMAGE

gcloud config set project $GCP_PROJECT_ID
gcloud config set compute/zone $GCP_ZONE

# for GAE
#gcloud app deploy --image-url=$GCP_IMAGE --project $GCP_PROJECT_ID --quiet
#gcloud --verbosity debug app deploy app.yaml --image-url $GCP_IMAGE --stop-previous-version --quiet

# for GKE
gcloud container clusters get-credentials $GCP_CLUSTER_NAME

#kubectl delete secret registry.gitlab.com
#kubectl create secret docker-registry registry.gitlab.com --docker-server=$CI_REGISTRY --docker-username=$DOCKER_USERNAME --docker-password=$DOCKER_PASSWORD --docker-email=$DOCKER_EMAIL
kubectl version

kubectl apply -f k8s/deployment.yaml
