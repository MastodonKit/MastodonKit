git_tag=$(shell git describe --tags `git rev-list --tags --max-count=1`)

all:
	echo "make [generate | preview | publish]"

generate:
	bundle install
	git worktree add jazzycode master
	cd jazzycode && swift package generate-xcodeproj
	cd jazzycode && bundle exec jazzy --clean \
					--disable-search \
					--module-version $(git_tag) \
					--github-file-prefix "https://github.com/MastodonKit/MastodonKit/tree/$(git_tag)"
	rm -rf jazzycode
	git worktree prune

preview:
	open docs/index.html

publish:
	git add .
	git commit -m "Updates documentation to version $(git_tag)"
