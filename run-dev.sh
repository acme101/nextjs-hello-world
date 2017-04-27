#!/bin/bash

set -e

yarn

# keep .gitkeep after yarn (for git)
touch node_modules/.gitkeep

# export to override environment variables defined on the .env file dynamically
# so that we don't have to re-create Docker image each time .env.dev is updated
export $(cat .env.dev | grep -v ^# | xargs)

yarn run dev
