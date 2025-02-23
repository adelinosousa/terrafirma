[![PR Checks](https://github.com/adelinosousa/terrafirma/actions/workflows/pr-checks.yml/badge.svg)](https://github.com/adelinosousa/terrafirma/actions)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/adelinosousa/terrafirma.svg?label=latest&sort=semver)](https://github.com/adelinosousa/terrafirma/releases)
[![Terraform Version](https://img.shields.io/badge/terraform-1.9.x-623CE4.svg?logo=terraform)](https://github.com/hashicorp/terraform/releases)

![terra_banner](https://github.com/user-attachments/assets/55cb0679-0302-4764-b485-c3ee96328d34)

# Overview 🚀

**Terrafirma** aims to be your go to place for automating all things DevOps and infrastructure on GitHub. Think of it as a collection of opinionated, modular GitHub Actions that make the heavy lifting of setting up repositories, managing releases, or provisioning cloud infrastructure as painless as possible. With Terrafirma, you get plug-and-play actions that handle the boring (but crucial) stuff—so you can focus on the fun parts of your project 😎.

## Usage 🔧

Most of our actions need a GitHub token with just the right permissions. Rather than spending hours juggling tokens and permissions (yawn 😴), you can simply install the Terrafirma GitHub App. This nifty app handles authentication securely, so you can get right down to business.

Ready to dive in? [Install the Terrafirma GitHub App](https://github.com/apps/terrafirma-linos) for your user, repository, or organization. Once you do, you'll get an API token that works with our `github-app-token` action to fetch the Terrafirma GitHub App token for you (check out the [example here](https://github.com/adelinosousa/terrafirma/tree/main/actions/github-app-token#usage)). Save the API token in your GitHub Actions secrets. It’s valid for 6 months (long enough for a mini vacation 🏖️), and you can regenerate it by reinstalling the app. Just remember, if you uninstall the app, the API token goes kaput 💥 and you won't be able to consume actions that require Github integration.

## Actions 🔨

- [google-get-secret](https://github.com/adelinosousa/terrafirma/tree/main/actions/google-get-secret): retrieves a secret from Google Secret Manager using OIDC (OpenID Connect)
- [create-repository](https://github.com/adelinosousa/terrafirma/tree/main/actions/create-repository): creates a new GitHub repository using common best practices
- [generate-tag](https://github.com/adelinosousa/terrafirma/tree/main/actions/generate-tag): generates a semantic version tag based on commit changes vs latest tag in main/master branch

## Contributions ❤️

Got ideas, improvements, or just want to say hi? We’d love to have you join us! Check out our [Contributions Guide](https://github.com/adelinosousa/terrafirma/blob/main/CONTRIBUTING.md) and feel free to open [issues](https://github.com/adelinosousa/terrafirma/issues/new) or submit pull requests. Let’s make DevOps less tedious together. 🙌

## License 📜

This project is licensed under the GPL v3 License. No secret handshakes here—just [read the full license](https://github.com/adelinosousa/terrafirma/blob/main/LICENSE) and enjoy the open-source goodness.
