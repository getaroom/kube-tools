#!/usr/bin/env bash

set -o errexit

KUBECTL=1.21.1
echo "downloading kubectl ${KUBECTL}"
curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL}/bin/linux/amd64/kubectl \
-o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
kubectl version --client

KUSTOMIZE=4.3.0
echo "downloading kustomize ${KUSTOMIZE}"
curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE}/kustomize_v${KUSTOMIZE}_linux_amd64.tar.gz | \
tar xz && mv kustomize /usr/local/bin/kustomize
kustomize version

HELM_V2=2.17.0
echo "downloading helm ${HELM_V2}"
curl -sSL https://get.helm.sh/helm-v${HELM_V2}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64
helm version --client

HELM_V3=3.6.3
echo "downloading helm ${HELM_V3}"
curl -sSL https://get.helm.sh/helm-v${HELM_V3}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /usr/local/bin/helmv3 && rm -rf linux-amd64
helmv3 version

KUBEVAL=0.16.1
echo "downloading kubeval ${KUBEVAL}"
curl -sL https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL}/kubeval-linux-amd64.tar.gz | \
tar xz && mv kubeval /usr/local/bin/kubeval
kubeval --version

KUBEAUDIT=0.14.2
echo "downloading kubeaudit ${KUBEAUDIT}"
curl -sSL https://github.com/Shopify/kubeaudit/releases/download/v${KUBEAUDIT}/kubeaudit_${KUBEAUDIT}_linux_amd64.tar.gz | \
tar xz && mv kubeaudit /usr/local/bin/kubeaudit
kubeaudit --help

CONFTEST=0.27.0
echo "downloading conftest ${CONFTEST}"
curl -sL https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST}/conftest_${CONFTEST}_Linux_x86_64.tar.gz | \
tar xz && mv conftest /usr/local/bin/conftest
conftest --version

KUBESEAL=0.16.0
echo "downloading kubeseal ${KUBESEAL}"
curl -sL https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL}/kubeseal-linux-amd64 \
-o /usr/local/bin/kubeseal && chmod +x /usr/local/bin/kubeseal
kubeseal --version

echo "downloading yq"
curl -sL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
-o /usr/local/bin/yq && chmod +x /usr/local/bin/yq
yq --version

echo "downloading jq"
curl -sL https://github.com/stedolan/jq/releases/latest/download/jq-linux64 \
-o /usr/local/bin/jq && chmod +x /usr/local/bin/jq
jq --version
