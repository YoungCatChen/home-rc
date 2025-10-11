# Function to change to the root directory of the current Git repository.
# To be in sync with `gitroot.fish`.

gitroot() {
  cd "$(git rev-parse --show-toplevel)"
}
