variable "github_token" {
  description = "The GitHub token for authentication"
  type        = string
}

variable "github_organisation" {
  description = "The GitHub organisation to create the repository in"
  type        = string
}

variable "github_username" {
  description = "The repository owner's GitHub username"
  type        = string
}

variable "repository_name" {
  description = "The name of the repository to create"
  type        = string

  validation {
    condition = var.repository_name != ""
    error_message = "Name of the repository must not be an empty string"
  }
}

variable "repository_description" {
  description = "The description of the repository to create"
  type        = string
}

variable "repository_private" {
  description = "Whether the repository should be private"
  type        = bool
}

variable "repository_template" {
  description = "The name of the repository template to use"
  type        = string
}