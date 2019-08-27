#!/bin/bash
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/git.id_rsa
