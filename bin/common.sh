#!/usr/bin/env bash

set -e
export PATH=$HOME/google-cloud-sdk/bin:$HOME/miniconda3/bin:$PATH
export virtual_environment_name="ml-ci-cd-demo"
export GOOGLE_APPLICATION_CREDENTIALS="./gcp_ml_ci_cd_demo.json"
export REGION="us-central1" # set to the same region where we're running Cloud ML Engine jobs
export PROJECT_ID="ml-ci-cd-demo"
export BUCKET=${PROJECT_ID}-mlengine
export MODEL_NAME="census_sklearn_pipeline"


exit_if_not_ci() {
  if [[ $CI != "true" ]]; then
    echo "[ERROR] This script should only be run on CI, and not on a local machine."
    echo "[ERROR] Exiting..."
    exit 1
  fi
}

echo "INFO: Setting project to ${PROJECT_ID}"
gcloud config set project $PROJECT_ID