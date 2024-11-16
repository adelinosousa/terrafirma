# Contributing to Terrafirma

Thank you for considering contributing to **Terrafirma**! We welcome contributions from the community to help improve and grow this project.

## How Can I Contribute?

### Reporting Bugs

- **Search Existing Issues**: Before submitting a bug report, check if the issue has already been reported.
- **Create a New Issue**: If it hasn't been reported, open a new issue and include detailed information and reproduction steps.

### Suggesting Enhancements

- **Discuss First**: Use the issue tracker to discuss the feature you want to implement.
- **Open an Issue**: If agreed upon, open an issue detailing the enhancement.

### Submitting Changes

#### Branch Naming Conventions

This project uses **Angular Commit Message Conventions** for branch names:

- `feat/` for new features
- `fix/` for bug fixes
- `docs/` for documentation changes
- `test/` for adding or updating tests
- `chore/` for maintenance tasks

Branches must also include the full name (lowercase) of the action so tests can trigger in a pull request. Examples:

- `feat/ACTION_NAME`
- `fix/ACTION_NAME`

#### Commit Message Guidelines

- Use clear and descriptive commit messages.

#### Coding Standards

- **Consistency**: Maintain the existing coding style.
- **Self-Contained Actions**: All GitHub Actions must be self-contained in their own directory under the [`actions`](actions) directory.
- **Testing**: Each action should be associated with a tests GitHub workflow if applicable. Place tests in the `.github/workflows` directory.
- **Action Tagging**: Actions are tagged versus specific commits using **Semantic Versioning** and prefixed with the Github Action name. Example: `ACTION_NAME-v1.0.0`

#### Pull Request Process

- Ensure your pull request addresses a single concern.
- Link any relevant issues in the pull request description.
- Be responsive to feedback and be prepared to make changes to your PR.

## Running Tests

Testing is crucial to ensure that your changes work as expected and do not introduce regressions. Our project uses automated tests that run every time a change is introduced to an action. To ensure tests run automatically whenever changes are made to an action, we use GitHub Actions workflows configured to trigger on `PR` changes within the action's subdirectory.

**Example Workflow Trigger:**

```yaml
on:
  pull_request:
    paths:
      - "actions/ACTION_NAME/**"
```

Replace `ACTION_NAME` with the name of your action directory.

## License

By contributing, you agree that your contributions will be licensed under the same license as the project. See the [LICENSE](LICENSE) file for more details.

---

Thank you for helping make **Terrafirma** better!
