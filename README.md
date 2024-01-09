# **TERRAFORM GUIDE**

**_published at_ 04/01/2024**

## **Table of Contents:**

1.  Terraform Plugin
2.  Provider
3.  Credentials
4.  Resources
5.  Output
6.  Data Sources
7.  Update Resources
8.  Delete Resources
9.  Variable
10. Terraform Module
11. existing module
12. wrap terraform with terragrunt

## **Pre-Requirements**

- install terraform https://developer.hashicorp.com/terraform/install
- terraform registry, see available all providers: https://registry.terraform.io
- setup gcloud CLI: https://cloud.google.com/sdk/gcloud/reference/auth/login
  ## **Content:**

1.  **Terraform Plugin:** For better experience, we could install Terraform Plugin from hashicorp, then configure the autocomplete prettify on save, we could setup it on settings.json on your vscode then add this block of code:

```
"[terraform]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "hashicorp.terraform",
    "editor.tabSize": 2 // optionally
  },
  "[terraform-vars]": {
    "editor.tabSize": 2 // optionally
  }
```

2.  **Provider:** make provider.tf file on your root folder, you can find all the sample on [here](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
3.  **Credentials:** Setup credentials on IAM console, and add key then download and put on your provider.tf
4.  **Resources:** you can find all the sample how to make resources on this [link](https://registry.terraform.io/providers/hashicorp/google/latest/docs), for example you can make a GCP instance with this [docs](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)
5.  **Output:** for example you can display output using output values, and you can find out the sample [here](https://developer.hashicorp.com/terraform/language/values/outputs)
6.  **Data Sources:** for example you can get data from GCP (meaning your source already made but not using terraform, so you need to integrate all the source in your terraform configutaions) using data sources, and you can find out the sample [here](https://developer.hashicorp.com/terraform/language/data-sources)
7.  **Update Resources:** for example if you wanna update the name of your virtual machine, you need to stop the service from running, then you can update the name in your terraform configuration, then run your terraform again. (warning: you have to be careful, because the resource will be replaced by the new updated one, and behind the scene, the old one will be deleted, and the new one will be added, even if you only change the name of your resource, but in some cases it will only be updated if you only change particular values e.g the image, the machine type, the zone, the tag. etc, and in some cases you also don't need to stop the resource from running like if you update the network tag/the tag). Tips: you can add this value for automatically stop the resource if you have updated any value on your config by adding this key value pairs: `allow_stopping_for_update = true`
8.  **Delete Resources:** you can delete resource with particular ways, first by running the command `terraform destroy` (warning: this command will destroy all resources), second you can delete the resource by using the command `terraform destroy -target=resource_name` (warning: sometimes the state of your terraform doesn't reflecting the actual condition of resource in your provider/cloud provider), and third you also able to destroy a specific resource by delete block of codes related to the resource/values
9.  **Variable:** is the way to store all the values for your terraform configuration, it's like reusable variables where you can use it everywhere in your terraform config. you actually can define all variables by several ways:

- first, you can run `terraform plan`, and then input all variables value one by one
- second, you can run `terraform plan -var-file=<your_variable_value>`
- third, you can make new terraform file named `terraform.tfvars` and put all your variables value there

10. **Terraform Module:** is the way to reuse your terraform configuration
11. **existing module:** is the way to reuse your terraform configuration that already made by other people
12. **wrap terraform with terragrunt:** wrapping your terragrunt configuration with terragrunt have a main benefit that is to manage your resurce cross environment easily
