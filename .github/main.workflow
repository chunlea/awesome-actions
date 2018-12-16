workflow "Publish to Surge.sh" {
  on = "push"
  resolves = ["./.github/actions/surge"]
}

action "docker://jekyll/jekyll" {
  uses = "docker://jekyll/jekyll"
  runs = "jekyll build"
  env = {
    JEKYLL_DATA_DIR = "/github/workspace"
  }
}

action "./.github/actions/surge" {
  uses = "./.github/actions/surge"
  needs = ["docker://jekyll/jekyll"]
  runs = "ls -la _site"
}
