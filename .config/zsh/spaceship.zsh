SPACESHIP_PROMPT_ORDER=(
  #time           # Time stamps section
  user           # Username section
  #host           # Hostname section
  dir            # Current directory section
  git            # Git section (git_branch + git_status)
  #hg             # Mercurial section (hg_branch  + hg_status)
  #package        # Package version
  node           # Node.js section
  bun            # Bun section
  #deno           # Deno section
  #ruby           # Ruby section
  #python         # Python section
  #elm            # Elm section
  #elixir         # Elixir section
  #xcode          # Xcode section
  #swift          # Swift section
  #golang         # Go section
  #perl           # Perl section
  #php            # PHP section
  #rust           # Rust section
  #haskell        # Haskell Stack section
  #scala          # Scala section
  #kotlin         # Kotlin section
  #java           # Java section
  lua            # Lua section
  #dart           # Dart section
  #julia          # Julia section
  #crystal        # Crystal section
  docker         # Docker section
  docker_compose # Docker section
  #aws            # Amazon Web Services section
  #gcloud         # Google Cloud Platform section
  #azure          # Azure section
  #venv           # virtualenv section
  #conda          # conda virtualenv section
  dotnet         # .NET section
  #ocaml          # OCaml section
  #vlang          # V section
  #zig            # Zig section
  #purescript     # PureScript section
  #erlang         # Erlang section
  #kubectl        # Kubectl context section
  #ansible        # Ansible section
  #terraform      # Terraform workspace section
  #pulumi         # Pulumi stack section
  #ibmcloud       # IBM Cloud section
  #nix_shell      # Nix shell
  #gnu_screen     # GNU Screen section
  #exec_time      # Execution time
  #async          # Async jobs indicator
  line_sep       # Line break
  #battery        # Battery level and status
  #jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

# PROMPT
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="true"

# USER
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX="@wsl-2"

# DIR
SPACESHIP_DIR_PREFIX=" "
SPACESHIP_DIR_TRUNC_REPO=false

# GIT
SPACESHIP_GIT_PREFIX=""

# GIT BRANCH
SPACESHIP_GIT_BRANCH_SHOW="${SPACESHIP_GIT_BRANCH_SHOW:=true}"
SPACESHIP_GIT_BRANCH_PREFIX="${SPACESHIP_GIT_BRANCH_PREFIX:="$SPACESHIP_GIT_SYMBOL"}"
SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_GIT_BRANCH_SUFFIX:=""}"
SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR:="magenta"}"

# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
#spaceship add --before char vi_mode

