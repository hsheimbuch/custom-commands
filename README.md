# Git Custom Commands
My collection of useful custom git commands.
## Setup
1. Pull the repo.
2. Add pulled repo dirpath to the $PATH.
## Overview
### git-sync-all
Syncs up all local branches of a Git repo to track the remote counterparts and pull the latest changes. 

#### Usage
1. Navigate into the Git repository.
2. ```git sync-all```

### git-dir-sync-all
Syncs up all local branches of all Git repos within the parent directory to track the remote counterparts and pull the latest changes. 

#### Usage
1. Navigate into the directory, containing multiple Git repositories. Only first-level git repos will be affected. The script will still run successfully even if not only Git repositories exist in the directory.
2. ```git dir-sync-all```
