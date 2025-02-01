# Create GitHub Repository

`create-repository` action allows you to create a new GitHub repositories using common best practices.

## Usage

Add the `adelinosousa/terrafirma/actions/github-app-token` action to your workflow:

```yaml
uses: adelinosousa/terrafirma/actions/github-app-token@github-app-token-v1.0.0
id: github-app-token
with:
  api_token: ${{ secrets.TERRAFIRMA_ACCESS_TOKEN }}
```

Use the `access_token` in your workflow:

```yaml
name: "Create repository"
id: create_repository
uses: adelinosousa/terrafirma/actions/create-repository@create-repository-v1.0.0
with:
  name: "test-repository"
  token: ${{ steps.github-app-token.outputs.access_token }}
  private: false
```

### Inputs

- `organisation`: **(optional)**: Name of the organization where the repository will be created. If omitted, the repository is created under the user account.
- `name`: **(required)**: Name of the repository to create.
- `description`: **(optional)**: Description of the repository.
- `private`: **(optional)**: Whether the repository is private. Defaults to true. If organisation is set, defaults to `internal`.
- `template`: **(optional)**: Name of the template repository to use.
- `token`: **(required)**: GitHub token with permissions to create repositories.

### Outputs

- `repository_url`: URL of the created repository.

## Contribute

See our [documentation](https://github.com/adelinosousa/terrafirma/blob/main/CONTRIBUTING.md) for details.

## References

- [Terraform GitHub Provider Docs](https://registry.terraform.io/providers/integrations/github/latest/docs)
