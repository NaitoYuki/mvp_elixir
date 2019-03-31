#!/bin/bash
docker-compose run --rm web bash -c "cd assets && npm $@"