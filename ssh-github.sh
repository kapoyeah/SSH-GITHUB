#!/bin/bash

read -p "Enter your email:" email

ssh-keygen -t ed25519 -C "${email}"

eval "$(ssh-agent -s)"

cat > ~/.ssh/config << EOF
Host *
   AddKeysToAgent yes
   IdentityFile ~/.ssh/id_ed25519
EOF

ssh-add ~/.ssh/id_ed25519

#Display Key to Terminal
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""

read -p "Copy SSH key to GitHub. "
#Test if working

ssh -T git@github.com

