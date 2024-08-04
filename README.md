# Git History Analyzer and Code Quality Predictor


## Introduction

The Git History Analyzer and Code Quality Predictor is a powerful GitHub Action that leverages machine learning to analyze your repository's git history and predict potential code quality issues. By examining commit patterns, code churn, and historical data, this tool provides valuable insights to help you improve your codebase.

## Features

- Analyze commit patterns and frequency
- Examine code churn (how often specific parts of the code change)
- Identify potential hotspots for bugs based on historical data
- Predict which files or components might need refactoring soon
- Suggest areas where more testing might be beneficial
- Provide insights on team collaboration patterns

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Output](#output)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Installation

To use this action in your workflow, add the following step to your `.github/workflows/main.yml` file:

```yaml
- name: Run Git History Analyzer
  uses: yourusername/git-history-analyzer@v1
  with:
    repo-token: ${{ secrets.GITHUB_TOKEN }}
```

## Usage

The Git History Analyzer and Code Quality Predictor can be triggered on various GitHub events. Here's an example workflow that runs on push and pull request events:

```yaml
name: Code Quality Analysis

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0  # This ensures all history is fetched
    - name: Run Git History Analyzer
      uses: yourusername/git-history-analyzer@v1
      with:
        repo-token: ${{ secrets.GITHUB_TOKEN }}
```

## Configuration

You can customize the behavior of the analyzer using the following input parameters:

| Input | Description | Default |
|---|---|---|
| `repo-token` | GitHub token for accessing the repository | `${{ secrets.GITHUB_TOKEN }}` |
| `min-commits` | Minimum number of commits to analyze | 100 |
| `analysis-depth` | Number of days to look back in history | 30 |
| `threshold-high` | Threshold for high-risk predictions | 0.8 |
| `threshold-medium` | Threshold for medium-risk predictions | 0.5 |

Example usage with custom configuration:

```yaml
- name: Run Git History Analyzer
  uses: yourusername/git-history-analyzer@v1
  with:
    repo-token: ${{ secrets.GITHUB_TOKEN }}
    min-commits: 200
    analysis-depth: 60
    threshold-high: 0.75
```

## Output

The action provides output in two formats:

- **GitHub Actions Log:** Detailed analysis results can be found in the Actions tab of your repository.
- **Pull Request Comments:** A summary of the analysis is automatically added as a comment to the pull request that triggered the action.

The output includes:

- List of potential bug hotspots
- Files recommended for refactoring
- Suggestions for increased test coverage
- Insights on team collaboration and code ownership

## Examples

**Basic usage**

```yaml
- name: Run Git History Analyzer
  uses: yourusername/git-history-analyzer@v1
  with:
    repo-token: ${{ secrets.GITHUB_TOKEN }}
```

**Advanced usage with custom thresholds**

```yaml
- name: Run Git History Analyzer
  uses: yourusername/git-history-analyzer@v1
  with:
    repo-token: ${{ secrets.GITHUB_TOKEN }}
    min-commits: 500
    analysis-depth: 90
    threshold-high: 0.85
    threshold-medium: 0.6
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Steps to contribute

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
<br>
Made with ❤️ by Bama Charan Chhandogi 
For issues, feature requests, or questions, please open an issue.
