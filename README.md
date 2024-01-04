**TERRAFORM GUIDE**
_published at_ 04/01/2024

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
3. Setup credentials on IAM console, and add key then download and put on your provider.tf
