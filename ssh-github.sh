#!/bin/bash

read -sp "Enter your email: " email

ssh-keygen -t ed25519 -C "$email"

eval "$(ssh-agent -s)"

cat > ~/.ssh/config << EOF
Host *
   AddKeysToAgent yes
   IdentityFile ~/.ssh/id_ed25519
EOF


ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub
read -p "Copy SSH key to GitHub."
ssh -T git@github.com

