# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Changelog entries are required for changes to library files.
has_app_changes = !git.modified_files.grep(/Sources/).empty?
no_readme_update = !git.modified_files.include?("README.md")
missing_doc_changes = git.modified_files.grep(/docs/).empty?
doc_changes_recommended = git.insertions > 15
if has_app_changes && missing_doc_changes && no_readme_update && doc_changes_recommended
  warn("Consider adding supporting documentation to this change. Documentation can be found in the `docs` directory.")
end

# Run SwiftLint
swiftlint.lint_files

# Check minimum coverage
xcov.report(scheme: 'MastodonKit', 
            project: 'MastodonKit.xcodeproj', minimum_coverage_percentage: 90)
