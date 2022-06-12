#!/usr/bin/env sh
echo "${1}" > /pw
echo "REPO: ${2}"
ansible-vault decrypt /key --vault-password-file /pw --output /key_dec
chmod 0400 /key_dec
ansible-playbook -u msmetko -i /inv --vault-password-file /pw --private-key /key_dec --extra-vars repo="${GITHUB_REPOSITORY}" /deploy.yaml
