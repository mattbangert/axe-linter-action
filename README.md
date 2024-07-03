# axe-linter-action

A GitHub Action to lint for any accessibility issues in your pull requests. This is a fork of the [offical action](https://github.com/dequelabs/axe-linter-action) from Deque.

## Key Differences from the Offical Action

- Dependencies are updated and will be maintained
- You can choose the supported file types to be linted by the action
- Linting is extended to the shell script as well
- A debug mode has been added to the shell script
- Semantic versioning will be used

## Input

### `github_token`

**Required** Your GitHub token for authentication.

### `api_key`

**Required** Your API key for axe-linter.

### `axe_linter_url`

**Optional** The URL for the axe-linter API. Defaults to `https://axe-linter.deque.com`.

### `files_pattern`

**Optional** File patterns to check for changes. Defaults to `'**/*.js,**/*.jsx,**/*.tsx,**/*.html,**/*.vue,**/*.md,**/*.markdown'`.

\* To request an API key for axe-linter, please visit [accessibility.deque.com/linter-contact-us](https://accessibility.deque.com/linter-contact-us). Once provisioned please visit [https://docs.deque.com/linter/1.0.0/en/axe-linter-api-key](https://docs.deque.com/linter/1.0.0/en/axe-linter-api-key) to get your API key.

## Example Usage

Create a file in your repository called `.github/workflows/axe-linter.yml` with the following contents, or add the steps to an existing workflow:

```yaml
name: Lint for accessibility issues

on: [pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
      - uses: mattbangert/axe-linter-action
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          api_key: ${{ secrets.AXE_LINTER_API_KEY }}
          axe_linter_url: https://axe-linter.deque.com
          files_pattern: '**/*.js,**/*.jsx,**/*.tsx,**/*.html,**/*.vue,**/*.md,**/*.markdown'