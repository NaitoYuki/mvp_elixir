#!/bin/bash
commands/mix.sh do deps.get, compile, ecto.setup
commands/npm.sh install
cp docker-compose.override.yml.example docker-compose.override.yml