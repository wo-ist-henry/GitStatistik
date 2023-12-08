#!/bin/bash
year=2023
# GraphQL-Abfrage ausführen und Liste der Repository-Namen erhalten
repos=$(gh api graphql --paginate -f query='
    query($endCursor: String) {
      viewer {
        repositoriesContributedTo(first: 100, contributionTypes: [COMMIT, ISSUE, PULL_REQUEST, REPOSITORY], after: $endCursor) {
          nodes { nameWithOwner }
          pageInfo {
            hasNextPage
            endCursor
          }
        }
      }
    }
' | jq -r '.data.viewer.repositoriesContributedTo.nodes[].nameWithOwner')

# Durch jedes Repository iterieren
for repo in $repos
do
  echo "Lade Daten für $repo..."
  # Anzahl der Commits
  commits=$(gh api repos/$repo/commits --paginate | jq length)

  # Anzahl der Mitwirkenden
  contributors=$(gh api repos/$repo/contributors  --paginate | jq length)

  # Ausgabe formatieren
  echo -e "Repository: $repo\nAnzahl der Commits: $commits\nAnzahl der Mitwirkenden: $contributors\n"
  commits=0
  contributors=0
done