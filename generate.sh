#/bin/bash

git_files_to_preserve=".gitignore .jazzy.yaml Gemfile Gemfile.lock generate.sh icon.png"
git_tag=$(git describe --tags $(git rev-list --tags --max-count=1))

# setup
git rm -rf .
git checkout HEAD -- $git_files_to_preserve

# create a local copy of master
git worktree add jazzycode master

# build project and documentation
cd jazzycode
swift package generate-xcodeproj
bundle exec jazzy --clean --disable-search --module-version $git_tag --github-file-prefix "https://github.com/MastodonKit/MastodonKit/tree/$git_tag"
cd -

# move docs to destination
mv docs/* .

# teardown
rm -rf jazzycode code undocumented.json && git worktree prune

# add new docs to git
git add .
git commit -m "Updates documentation to version $git_tag"
