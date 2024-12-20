# Create GitHub Repository with Best Practices

The `create-repository` action allows you to create a new GitHub repositories using common best practices.

## Usage

### Create Github Token

- Permissions to create repositories `repo` scope for user repositories or appropriate organizational permissions.
- If creating repositories in an organization, ensure you have the necessary access rights.

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
