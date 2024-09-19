#!/bin/bash
set -e

# Determine the correct Python command
if command -v python3 &>/dev/null; then
    PYTHON_CMD=python3
elif command -v python &>/dev/null; then
    PYTHON_CMD=python
else
    echo "Error: Neither 'python3' nor 'python' command found"
    exit 1
fi

echo "Using Python command: $PYTHON_CMD"

# Upgrade pip and setuptools
$PYTHON_CMD -m pip install --upgrade pip setuptools

# Install dependencies
$PYTHON_CMD -m pip install -r requirements.txt

# Run linting
$PYTHON_CMD -m flake8 . 

# Run migrations
$PYTHON_CMD manage.py migrate

# Collect static files
if $PYTHON_CMD manage.py collectstatic --noinput; then
    echo "Static files collected successfully"
else
    echo "Warning: Failed to collect static files. This might be okay for development."
fi

# Run tests
$PYTHON_CMD manage.py test