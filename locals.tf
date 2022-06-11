locals {

  env = terraform.workspace

  rgname_name_list = {
    default = "defaultrg"
    dev = "devrg"
    qa = "qarg"
  }

  rgname = lookup(local.rgname_name_list,local.env,null)

}