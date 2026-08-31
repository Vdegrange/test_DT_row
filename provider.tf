terraform {
    cloud{
        organization = "test_genesys"
        workspaces {
          name = "test_genesys_cloud_cicd"
        }
    }
    required_providers {
        genesyscloud = {
            source = "mypurecloud/genesyscloud"
            version = ">=1.50.0"
        }
    }
}
# provider "genesyscloud" {
#   oauthclient_id = GENESYSCLOUD_OAUTHCLIENT_ID
#   oauthclient_secret = GENESYSCLOUD_OAUTHCLIENT_SECRET
#   aws_region = GENESYSCLOUD_REGION
#   sdk_debug = true
# }

