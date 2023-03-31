######################################################
## KopiCloud AD API - Create OU (Organization Unit) ##
######################################################

# ou Name
resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

# Create a OU
resource "kopicloud_ou" "test" {
  ou_destination_path = "DC=kopicloud,DC=local"
  ou_name             = "kopicloud-labtest-${random_string.random.result}"
  protected           = false
  description         = "OU for KopiCloud Lab Test"
}

# Returns Created OU
output "OUTPUT_created_ou" {
  description = "Created OU"
  value       = resource.kopicloud_ou.test
}

