#!/bin/bash

# Make sure the scripts are executable
chmod +x scripts/app-installs.sh scripts/config-installs.sh

# Run application installations
echo "Starting application installations..."
./scripts/app-installs.sh

# Run configuration installations
echo "Starting configuration installations..."
./scripts/config-installs.sh

echo "Environment setup complete!"

