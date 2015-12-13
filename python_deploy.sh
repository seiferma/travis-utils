#!/bin/bash

# create credentials file
echo "[distutils]" > ~/.pypirc
echo "index-servers = dest" >> ~/.pypirc
#echo "pypi" >> ~/.pypirc
echo "[dest]" >> ~/.pypirc
echo "repository=$DEPLOY_URL" >> ~/.pypirc
echo "username=$DEPLOY_USER" >> ~/.pypirc
echo "password=$DEPLOY_PW" >> ~/.pypirc

# deploy
python setup.py sdist upload  -r dest || exit 1
python setup.py upload_docs -r dest

# cleanup
rm ~/.pypirc