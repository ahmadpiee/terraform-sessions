**TERRAFORM GUIDE**
_published at_ 04/01/2024

<br/>

**Table Content:**

1. Terraform Plugin
2. Provider
3. Credentials
4. Resources
5. Output
6. Data Sources
7. Update Resources
8. Delete Resources
9. Variable
   <br/>
   **Pre-Requirements**

- install terraform https://developer.hashicorp.com/terraform/install
- terraform registry, see available all providers: https://registry.terraform.io
- setup gcloud CLI: https://cloud.google.com/sdk/gcloud/reference/auth/login
  <br/>
  **Content:**

1. **Terraform Plugin:** For better experience, we could install Terraform Plugin from hashicorp, then configure the autocomplete prettify on save, we could setup it on settings.json on your vscode then add this block of code:

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

2. **Provider:** make provider.tf file on your root folder, you can find all the sample on [here](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
3. **Credentials:** Setup credentials on IAM console, and add key then download and put on your provider.tf
4. **Resources:** you can find all the sample how to make resources on this [link](https://registry.terraform.io/providers/hashicorp/google/latest/docs), for example you can make a GCP instance with this [docs](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)
5. **Output:** for example you can display output using output values, and you can find out the sample [here](https://developer.hashicorp.com/terraform/language/values/outputs)
6. **Data Sources:** for example you can get data from GCP (meaning your source already made but not using terraform, so you need to integrate all the source in your terraform configutaions) using data sources, and you can find out the sample [here](https://developer.hashicorp.com/terraform/language/data-sources)
7. **Update Resources:** for example if you wanna update the name of your virtual machine, you need to stop the service from running, then you can update the name in your terraform configuration, then run your terraform again. (warning: you have to be careful, because the resource will be replaced by the new updated one, and behind the scene, the old one will be deleted, and the new one will be added, even if you only change the name of your resource)
