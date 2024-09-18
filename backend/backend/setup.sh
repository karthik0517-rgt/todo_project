#!/bin/bash
set -e

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Collect static files (if applicable)
python manage.py collectstatic --noinput

# Run tests
python manage.py test