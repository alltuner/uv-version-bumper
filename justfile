# List available commands
default:
    @just --list

# Bump version by patch and create git tag
bump-patch:
    @just bump-and-tag patch

# Bump version by minor and create git tag
bump-minor:
    @just bump-and-tag minor

# Bump version by major and create git tag
bump-major:
    @just bump-and-tag major

# Internal recipe to bump version and create git tag
bump-and-tag type:
    #!/usr/bin/env bash
    # Check if the repo is clean
    if [[ -n $(git status --porcelain) ]]; then
        echo "Error: Git repository has uncommitted changes. Please commit or stash them first."
        exit 1
    fi
    
    # Get the current version before bumping
    OLD_VERSION=$(uv version --short)
    echo "Current version: $OLD_VERSION"
    
    # Bump the version
    echo "Bumping {{ type }} version..."
    uv version --bump {{ type }}
    
    # Get the new version
    NEW_VERSION=$(uv version --short)
    echo "New version: $NEW_VERSION"
    
    # Run uv sync to update the lock file
    echo "Updating lock file with uv sync..."
    uv sync
    
    # Commit both the pyproject.toml and lock file changes in one commit
    git add pyproject.toml
    git add .
    git commit -m "Bump version: $OLD_VERSION → $NEW_VERSION"
    
    # Create tag directly rather than calling another recipe
    VERSION=$NEW_VERSION
    TAG="v$VERSION"
    
    # Check if tag already exists
    if git rev-parse "$TAG" >/dev/null 2>&1; then
        echo "Tag $TAG already exists. Skipping tag creation."
    else
        echo "Creating git tag $TAG..."
        git tag -a "$TAG" -m "Version $VERSION"
        echo "Created git tag: $TAG"
        echo "To push the tag, run: git push origin $TAG"
    fi

# Create git tag from current version if it doesn't exist
tag-version:
    #!/usr/bin/env bash
    VERSION=$(uv version --short)
    TAG="v$VERSION"
    
    # Check if tag already exists
    if git rev-parse "$TAG" >/dev/null 2>&1; then
        echo "Tag $TAG already exists. Skipping tag creation."
    else
        echo "Creating git tag $TAG..."
        git tag -a "$TAG" -m "Version $VERSION"
        echo "Created git tag: $TAG"
        echo "To push the tag, run: git push origin $TAG"
    fi

# Push the latest version tag to remote
push-tag:
    #!/usr/bin/env bash
    VERSION=$(uv version --short)
    TAG="v$VERSION"
    
    # Check if tag exists locally
    if git rev-parse "$TAG" >/dev/null 2>&1; then
        echo "Pushing tag $TAG to remote..."
        git push origin "$TAG"
        echo "Tag $TAG pushed successfully!"
    else
        echo "Tag $TAG does not exist locally. Create it first with 'just tag-version'."
        exit 1
    fi

# Push both commits and tag to remote
push-all:
    #!/usr/bin/env bash
    VERSION=$(uv version --short)
    TAG="v$VERSION"
    
    # Push commits
    echo "Pushing commits to remote..."
    git push
    
    # Check if tag exists locally
    if git rev-parse "$TAG" >/dev/null 2>&1; then
        echo "Pushing tag $TAG to remote..."
        git push origin "$TAG"
        echo "All changes pushed successfully!"
    else
        echo "Tag $TAG does not exist locally. Create it first with 'just tag-version'."
        exit 1
    fi

# Show current version
version:
    @uv version --short
