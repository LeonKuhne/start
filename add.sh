#!/bin/bash

target_dir="/home/home/Projects/start"
target="links.csv"

# verify usage
if [ $# -lt 2 ]; then
  echo "Usage: $0 <url> <...desc>"
  exit 1
fi

# parse params
url="$1"
shift
desc="$*"

(
  cd $target_dir
  # insert data
  echo "$desc, $url" >> "$target"

  # update site
  git add "$target"
  git commit -m "added link to $desc"
  git push
)

# notify user
echo "Added Link"
echo "  url: $url"
echo "  desc: $desc"
