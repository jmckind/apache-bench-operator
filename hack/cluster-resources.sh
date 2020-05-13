#!/usr/bin/env bash

# Copyright 2020 Apache Bench Operator Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

HACK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${HACK_DIR}/env.sh

# Install the required resources for the operator into a kubernetes cluster
# NOTE: This script does NOT install the operator itself, use cluster-install.sh for that, which calls this script.

# Set up RBAC for the operator and components.
kubectl create -n ${AB_OPERATOR_NAMESPACE} -f ${AB_OPERATOR_DEPLOY_DIR}/service_account.yaml
kubectl create -n ${AB_OPERATOR_NAMESPACE} -f ${AB_OPERATOR_DEPLOY_DIR}/role.yaml
kubectl create -n ${AB_OPERATOR_NAMESPACE} -f ${AB_OPERATOR_DEPLOY_DIR}/role_binding.yaml


# Add the CRDs to the cluster.
kubectl create -f ${AB_OPERATOR_DEPLOY_DIR}/crds
