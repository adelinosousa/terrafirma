# Generate Semver Tag

`generate-tag` action generates a semantic version tag based on commit changes and latest tag in your main/master branch. If no tags are found, the action defaults to version `0.0.0`.

Version tags bump using the following strategy:

- **Major**: If commit message contains keyword `breaking change`, the major version is bumped.
- **Minor**: If commit message contains keyword `feat`, the minor version is bumped.
- **Patch**: Default version bump if no breaking change or feature is found in commit messages.

## Usage

Add the `adelinosousa/terrafirma/actions/github-app-token` action to your workflow:

```yaml
uses: adelinosousa/terrafirma/actions/github-app-token@github-app-token-v1.0.0
id: github-app-token
with:
  api_token: ${{ secrets.TERRAFIRMA_ACCESS_TOKEN }}
```

Use the `access_token` with the `generate-tag` action:

```yaml
uses: adelinosousa/terrafirma/actions/generate-tag@generate-tag-v1.0.0
id: generate_tag
with:
  token: ${{ steps.github-app-token.outputs.access_token }}
```

### Inputs

- `token`: **(required)**: GitHub token with permissions to create tags, read commits and repository.

### Outputs

- `new_tag`: Newly generated semantic version tag.

## Contribute

See our [documentation](https://github.com/adelinosousa/terrafirma/blob/main/CONTRIBUTING.md) for details.

## References

- [Terraform GitHub Provider Docs](https://registry.terraform.io/providers/integrations/github/latest/docs)
