package main
import input.configuration.provider_config as tfplan

allowed_providers := {
"registry.terraform.io/hashicorp/aws",
"registry.terraform.io/hashicorp/azurerm"
}

whitelisted_providers[provider]{
    provider := tfplan[_].full_name
    not allowed_providers[provider]
}

deny[msg] {
    count(whitelisted_providers) > 0
    msg := sprintf("Module %s is not authorized", [whitelisted_providers[_]])
}
