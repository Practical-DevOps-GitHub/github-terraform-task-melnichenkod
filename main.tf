terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.16.0"
    }
  }
}

provider "github" {
  organization = https://github.com/Practical-DevOps-GitHub
}

resource "github_repository" "example" {
  name             = https://github.com/Practical-DevOps-GitHub/github-terraform-task-melnichenkod
  private          = true
  default_branch   = "develop"
  auto_init        = true
  has_issues       = true
  has_projects     = false
  has_wiki         = false
  delete_branch_on_merge = false
}

resource "github_repository_collaborator" "example" {
  repository = https://github.com/Practical-DevOps-GitHub/github-terraform-task-melnichenkod
  username   = "softservedata"  
  permission = "push"
}

resource "github_branch_protection" "main" {
  repository     = https://github.com/Practical-DevOps-GitHub/github-terraform-task-melnichenkod
  branch         = "main"
  enforce_admins = true
  required_pull_request_reviews {
    dismiss_stale_reviews      = false
    require_code_owner_reviews = true
    required_approving_review_count = 1
  }
  required_status_checks {
    strict   = true
    contexts = []
  }
  restrictions {
    users     = []
    teams     = []
    apps      = []
  }
}

resource "github_branch_protection" "develop" {
  repository     = 
  branch         = "develop"
  enforce_admins = true
  required_pull_request_reviews {
    dismiss_stale_reviews      = false
    require_code_owner_reviews = false
    required_approving_review_count = 2
  }
  required_status_checks {
    strict   = true
    contexts = []
  }
  restrictions {
    users     = []
    teams     = []
    apps      = []
  }
}
}
