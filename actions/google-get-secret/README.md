# Keyless Google Secret Retrieval

`google-get-secret` action retrieves a secret from Google Secret Manager using OIDC (OpenID Connect).

## Setting Up Workload Identity Federation

To use keyless authentication, you need to set up the Workload Identity Federation in Google Cloud:

1. **Enable Workload Identity Federation**:

   - Go to the IAM & Admin section in the Google Cloud Console.
   - Select "Workload Identity Federation" and create a new provider.
   - Configure the provider with the necessary details, including the issuer URL from GitHub.

2. **Create a Service Account**:

   - Create a new service account or use an existing one.
   - Grant the service account the following roles:
     - `Workload Identity User`
     - `Secret Manager Secret Accessor`
     - `Service Account User`

3. **Configure the Workload Identity Provider**:

   - Link the service account to the workload identity provider.
   - Ensure that the provider is configured to trust tokens from GitHub Actions.

## Usage

Set GitHub Actions workflow permissions:

```yaml
permissions:
  contents: read
  id-token: write
```

Update your workflow the `adelinosousa/terrafirma/actions/google-get-secret` action:

```yaml
- name: "Get Secret from Google Secret Manager"
  id: get-secret
  uses: adelinosousa/terrafirma/actions/google-get-secret@google-get-secret-v1.0.0
  with:
    project_id: "your-gcp-project-id"
    workload_identity_provider: "your-workload-identity-provider"
    service_account: "your-service-account"
    secret_name: "your-secret-name"
```

Use the `secret` value where's needed:

```yaml
- name: Secret output
  run: |
    echo ${{ steps.get-secret.outputs.secret }}
```

### Inputs

- `project_id`: **(required)** The Google Cloud Project ID.
- `workload_identity_provider`: **(required)** The Workload Identity Provider.
- `service_account`: **(required)** The Service Account email.
- `secret_name`: **(required)** The name of the secret to retrieve.

### Outputs

- `secret`: Secret value. Masked for security.

For more information, visit the [Google Cloud Blog](https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions).

## References

- [Google Cloud Secret Manager Documentation](https://cloud.google.com/secret-manager/docs)
- [Google Cloud Workload Identity Federation](https://cloud.google.com/iam/docs/workload-identity-federation)
- [Google Secret Manager Free Tier](https://cloud.google.com/free/docs/free-cloud-features#secret-manager)
