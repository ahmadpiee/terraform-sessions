**TERRAFORM GUIDE**
_published at_ 04/01/2024

- install terraform https://developer.hashicorp.com/terraform/install
- terraform registry, see available all providers: https://registry.terraform.io
- setup gcloud CLI: https://cloud.google.com/sdk/gcloud/reference/auth/login
- setup credentials on IAM console, and add key then download and put on yout provider.tf
- for better experience, we could install terraform plugin from hashicorp
  then configure the autocomplete prettify on save, we could setup it on settings.json on your vscode then add this block of code:

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
