# ------------------------------------
# alias and function
# ------------------------------------
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"
alias ds="du -smc"


# ------------------------------------
# Git alias and function
# ------------------------------------

# Show all alias related git
galias() { alias | grep 'git' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Display status
alias gst="git status"

# Stage all changes in the current directory
alias ga.="git add ."

# Commit changes
alias gcm="git commit -m"
alias gcam="git commit -am"

# Display diff
alias gd="git diff"
alias gdc="git diff --cached"

# Pull changes
alias gl="git pull"
alias gup="git pull --rebase"

# Push changes
alias gp="git push"
alias gd="git diff"

# Git Stash
alias gs="git stash"
alias gss="git stash save"
alias gsp="git stash pop"

# Git Log Tree
alias gtree="git log --graph --pretty=format:'%x09%C(auto) %h %Cgreen %ar %Creset%x09by\"%C(cyan ul)%an%Creset\" %x09%C(auto)%s %d'"

# List all modified and untracked files, e.g., vim $(gchanges)
gchanges() { git ls-files --exclude-standard --modified --other; }


# ------------------------------------
# Docker alias and function
# ------------------------------------

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Dockerfile build, e.g., $dbu shomrkm/test 
dbu() { docker build -t=$1 .; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }