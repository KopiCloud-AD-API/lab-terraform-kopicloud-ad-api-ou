####################################################
## KopiCloud AD API - List OU (Organization Unit) ##
####################################################

# OU #1 Name
resource "random_string" "random1" {
  length  = 4
  special = false
  upper   = false
}

# OU #2 Name
resource "random_string" "random2" {
  length  = 6
  special = false
  upper   = false
}

# Create a OU #1
resource "kopicloud_ou" "test_ou_1" {
  ou_destination_path = var.ou_path
  ou_name             = "kopicloud-labtest-${random_string.random1.result}"
  protected           = false
  description         = "OU for KopiCloud Lab Test"
}

# Returns Created OU
output "OUTPUT_created_ou_1" {
  description = "Created OU #1"
  value       = resource.kopicloud_ou.test_ou_1
}

# Create a OU #2
resource "kopicloud_ou" "test_ou_2" {
  depends_on = [ kopicloud_ou.test_ou_1 ]

  ou_destination_path = kopicloud_ou.test_ou_1.ou_path
  ou_name             = "kopicloud-labtest-${random_string.random2.result}"
  protected           = false
  description         = "OU for KopiCloud Lab Test"
}

# Returns Created OU #2
output "OUTPUT_created_ou_2" {
  description = "Created OU #2"
  value       = resource.kopicloud_ou.test_ou_2
}

# List OUs
data "kopicloud_ou_list" "test" {
  depends_on = [ kopicloud_ou.test_ou_1, kopicloud_ou.test_ou_2 ]

  ou_path = kopicloud_ou.test_ou_1.ou_path
}

# Returns List of OUs
output "OUTPUT_list_ou" {
  description = "List of Existing OUs"
  value       = data.kopicloud_ou_list.test
}
