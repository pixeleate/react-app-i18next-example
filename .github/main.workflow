workflow "build, test and publish on release" {
  on = "push"
  resolves = "lint"
}

# install with yarn
action "install" {
  uses = "docker://circleci/node:10-browsers"
  runs = "yarn"
  args = "install"
}

# build with yarn
action "lint" {
  needs = "install"
  uses = "docker://circleci/node:10-browsers"
  runs = "yarn"
  args = "lint"
}
