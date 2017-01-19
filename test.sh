#!/bin/sh
touch 1234
git add 1234
git commit -m '$Release_Note'
git push
git tag -a jenkins -m '$Release_Note'
git push origin jenkins
