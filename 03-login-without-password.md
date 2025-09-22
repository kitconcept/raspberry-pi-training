# Passwordless and Secure Login via SSH Key

## Generate an SSH key locally

````
cd .ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
````

Source: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Copy your public SSH key to the Raspberry Pi

````
ssh-copy-id -i /Users/timo/.ssh/<yourname>.pub pi@raspberrypi.local
````

## Login without a password

````
ssh raspberrypi.local
````
