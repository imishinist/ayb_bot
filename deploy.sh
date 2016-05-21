ssh $USER@$DEPLOY_HOST 'cd ayb_bot; eval `ssh-agent`; ssh-add ~/.ssh/travis_key; git pull origin master'
