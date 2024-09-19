#!/bin/bash
set -e

# Upgrade pip and install dependencies
python3 -m pip install --user --upgrade pip setuptools wheel
python3 -m pip install --user -r requirements.txt

# Run linting
python3 -m flake8 .

# Run migrations
python3 manage.py migrate

# Collect static files
python3 manage.py collectstatic --noinput

# Run tests
python3 manage.py test