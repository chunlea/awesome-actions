workflow "Publish to Surge.sh" {
  on = "push"
  resolves = ["docker://jekyll/jekyll"]
}

action "docker://jekyll/jekyll" {
  uses = "docker://jekyll/jekyll"
  runs = "jekyll build"
  env = {
    JEKYLL_DATA_DIR = "/github/workspace"
  }
}
