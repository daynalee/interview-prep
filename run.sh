#!/usr/bin/env bash
# Open the local copy with the profile already loaded.
# Regenerates the profile from ~/interview-agent/me/ first, so it is always current.
set -euo pipefail
cd "$(dirname "$0")"

if [ -x ../interview-agent/build-profile.sh ]; then
  ../interview-agent/build-profile.sh >/dev/null && echo "Profile refreshed from me/ files."
fi

PORT=5199
if ! curl -s -o /dev/null "http://localhost:$PORT" 2>/dev/null; then
  python3 -m http.server "$PORT" --directory . >/dev/null 2>&1 &
  sleep 1
  echo "Started server on port $PORT."
else
  echo "Server already running on port $PORT."
fi

open "http://localhost:$PORT"
echo "Opened http://localhost:$PORT with your profile preloaded."
