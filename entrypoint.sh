#!/usr/bin/env sh
echo "${1}" > pw
ansible-vault decrypt key --vault-password-file pw --output key_dec
chmod 0400 key_dec
#ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u msmetko -i inv --vault-password-file pw --private-key key_dec deploy.yaml
ansible-playbook -u msmetko -i inv --vault-password-file pw --private-key key_dec deploy.yaml
