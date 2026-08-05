# Justfile - Local Task Runner for Symbiosis

# Default recipe: list all available operations
default:
    @just --list

# Generate a new specification file from template inside specs/YYYY/MM/
spec TITLE="new-task":
    #!/usr/bin/env bash
    set -euo pipefail
    
    YEAR=$(date +%Y)
    MONTH=$(date +%m)
    DATE=$(date +%Y-%m-%d)
    
    # Clean title (replace spaces with hyphens, lowercase)
    SLUG=$(echo "{{TITLE}}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    
    DIR="specs/${YEAR}/${MONTH}"
    FILE="${DIR}/${DATE}-${SLUG}.md"
    
    mkdir -p "${DIR}"
    
    if [ -f "${FILE}" ]; then
        echo "Error: Specification file '${FILE}' already exists."
        exit 1
    fi
    
    cp specs/_template.md "${FILE}"
    echo "Created new spec file: ${FILE}"

# Build local artifacts
build:
    @echo "Building local artifacts..."

# Run local test suite
test:
    @echo "Running local tests..."

# Run local development environment
dev:
    @echo "Starting local dev environment..."
