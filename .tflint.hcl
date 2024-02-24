config {
  module              = true
  force               = false
  disabled_by_default = false
  varfile             = ["test.tfvars"]
}

plugin "google" {
  enabled    = true
  version    = "0.23.1"
  source     = "github.com/terraform-linters/tflint-ruleset-google"
  deep_check = false
}

rule "google_compute_instance_invalid_machine_type" {
  enabled = true
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_deprecated_index" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = false
}

rule "terraform_typed_variables" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
}

rule "terraform_naming_convention" {
  enabled = true

  #Require specific naming structure
  variable {
    format = "snake_case"
  }

  locals {
    format = "snake_case"
  }

  output {
    format = "snake_case"
  }

  #Allow any format
  resource {
    format = "none"
  }

  module {
    format = "none"
  }

  data {
    format = "none"
  }

}

# Ensure that a module complies with the Terraform Standard Module Structure
rule "terraform_standard_module_structure" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}
  
