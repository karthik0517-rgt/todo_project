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

# Install dependencies
$PYTHON_CMD -m pip install -r requirements.txt

# Run migrations
$PYTHON_CMD manage.py migrate

# Collect static files (if applicable)
$PYTHON_CMD manage.py collectstatic --noinput

# Run tests
$PYTHON_CMD manage.py test