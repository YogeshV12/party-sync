# Shared helpers for scripts/*.sh. Sourced, not executed.

MIN_FLUTTER="3.47.0"

if [[ -t 1 ]]; then
  _b=$'\033[1m'; _g=$'\033[32m'; _y=$'\033[33m'; _r=$'\033[31m'; _n=$'\033[0m'
else
  _b=""; _g=""; _y=""; _r=""; _n=""
fi

step() { echo; echo "${_b}==> $*${_n}"; }
ok()   { echo "${_g}✓${_n} $*"; }
warn() { echo "${_y}!${_n} $*"; }
fail() { echo "${_r}✗${_n} $*" >&2; }
have() { command -v "$1" >/dev/null 2>&1; }

version_ge() { [[ "$(printf '%s\n%s\n' "$2" "$1" | sort -V | head -1)" == "$2" ]]; }

require_flutter_version() {
  local v
  v=$(flutter --version --machine 2>/dev/null | sed -n 's/.*"frameworkVersion": *"\([^"]*\)".*/\1/p')
  if [[ -n "$v" ]] && ! version_ge "$v" "$MIN_FLUTTER"; then
    fail "Flutter $v is older than $MIN_FLUTTER. Run: flutter upgrade"
    return 1
  fi
}

# Prints the path of a JDK 17 home, or fails.
find_java17() {
  local candidates=()
  [[ -n "${JAVA_HOME:-}" ]] && candidates+=("$JAVA_HOME")
  [[ "$(uname)" == "Darwin" ]] && candidates+=("$(/usr/libexec/java_home -v 17 2>/dev/null || true)")
  candidates+=(
    /opt/homebrew/opt/openjdk@17
    /usr/local/opt/openjdk@17
    "/Applications/Android Studio.app/Contents/jbr/Contents/Home"
    /usr/lib/jvm/java-17-openjdk-amd64
    /usr/lib/jvm/java-17-openjdk
  )
  local jdk
  jdk=$(flutter config --list 2>/dev/null | sed -n 's/^ *jdk-dir: *//p')
  [[ -n "$jdk" ]] && candidates=("$jdk" "${candidates[@]}")
  for c in "${candidates[@]}"; do
    if [[ -n "$c" && -x "$c/bin/java" ]] && "$c/bin/java" -version 2>&1 | grep -q '"17'; then
      echo "$c"
      return 0
    fi
  done
  return 1
}
