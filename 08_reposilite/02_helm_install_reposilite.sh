#!/bin/bash

# Add the repository
helm repo add reposilite https://helm.reposilite.com/

# Update local repository information
helm repo update

# Install the Helm chart into the namespace 'equino-reposilite', using the custom values
helm install reposilite reposilite/reposilite -n equino-reposilite -f values.yaml
