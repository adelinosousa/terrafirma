# https://registry.terraform.io/providers/integrations/github/latest/docs

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.3.1"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_organisation
}

resource "github_repository" "repository" {
  name                    = var.repository_name
  description             = var.repository_description
  visibility              = var.repository_private ? (var.github_organisation == "" ? "private" : "internal") : "public"
  has_issues              = true
  allow_rebase_merge      = false
  allow_merge_commit      = false
  allow_squash_merge      = true
  allow_auto_merge        = true
  delete_branch_on_merge  = true
  allow_update_branch     = true
  auto_init               = true

  dynamic "template" {
    for_each = var.repository_template != "" ? [var.repository_template] : []
    content {
      owner = var.github_organisation == "" ? var.github_username : var.github_organisation
      repository = template.value
    }
  }

  security_and_analysis {
    # Requires GitHub Enterprise with GitHub Advanced Security license
    # advanced_security {
    #   status = "enabled"
    # }
    secret_scanning {
      status = var.repository_private ? "disabled" : "enabled"
    }
    secret_scanning_push_protection {
      status = var.repository_private ? "disabled" : "enabled"
    }
  }

  lifecycle {
    ignore_changes = [
      has_issues,
      allow_rebase_merge,
      allow_merge_commit,
      allow_squash_merge,
      allow_auto_merge,
      delete_branch_on_merge,
      allow_update_branch,
      auto_init,
    ]
    prevent_destroy = true
  }
}

resource "github_branch" "main" {
  repository = github_repository.repository.name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = github_repository.repository.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repository.id
  pattern                         = github_branch_default.default.branch
  enforce_admins                  = true
  require_signed_commits          = true
  required_linear_history         = true
  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    restrict_dismissals             = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
    require_last_push_approval      = true
  }

  required_status_checks {
    strict   = true
    contexts = []
  }

  lifecycle {
    ignore_changes = [
      pattern,
    ]
    prevent_destroy = true
  }
}

resource "github_repository_collaborator" "maintainer" {
  repository = github_repository.repository.name
  username   = var.github_username
  permission = "maintain"
}

resource "github_repository_environment" "development" {
  environment         = "development"
  repository          = github_repository.repository.name
  can_admins_bypass   = true
  prevent_self_review = false
}

resource "github_repository_environment" "production" {
  environment         = "production"
  repository          = github_repository.repository.name
  can_admins_bypass   = false
  prevent_self_review = true
}

