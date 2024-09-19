#!/bin/bash
set -e

# Upgrade pip and setuptools
pip install --upgrade pip setuptools wheel

# Install dependencies
pip install -r requirements.txt

# Run linting
python -m flake8 .

# Run migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Run tests
python manage.py test