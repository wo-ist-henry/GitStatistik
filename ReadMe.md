# GitHub Statistics Script

This is a Bash script that collects and analyzes GitHub statistics for a specific user and a specific year.

## Description

The script collects data about the number of commits, the number of added and deleted lines for each repository of a certain GitHub user in a certain year.

## Prerequisites

- Bash
- GitHub CLI

## Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/yourusername/yourrepository.git
cd yourrepository
chmod +x GitHub.sh
```

## Usage
Set the GitHub username and the year for which you want to collect statistics at the beginning of the script:

# Set GitHub Username
```bash
GITHUB_USER="username"
```

# Set the year for which the statistics should be retrieved
```bash
YEAR="year"
```

Then run the script:
```bash
./GitHub.sh
``````

The script will then start collecting data for the specified GitHub user for the specified year. It will go through each repository of the user, count the number of commits, and sum up the number of added and deleted lines for each commit.

If there is an error retrieving the commits for a repository, the script will output an error message and exit.

# Contributing
Contributions are welcome. Please open an issue or submit a pull request.

# License
Please specify the license for your project.

```

Please replace the placeholder texts with the appropriate information about your project.
