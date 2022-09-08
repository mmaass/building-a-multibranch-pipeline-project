#!/usr/bin/env sh

echo 'The following "npm" command builds your Node.js/React application for'
echo 'production in the local "build" directory (i.e. within the appropriate'
echo 'subdirectory of "/var/jenkins_home/workspace/"), correctly bundles React'
echo 'in production mode and optimizes the build for the best performance.'
set -x
npm run build
set +x

