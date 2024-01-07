variable "deployment" {
  type = object({
    cognitive_account_id   = string
    name                   = string
    rai_policy_name        = optional(string)
    version_upgrade_option = optional(string)
    model = object({
      format  = string
      name    = string
      version = string
    })
    scale = object({
      capacity = optional(number)
      family   = optional(string)
      size     = optional(string)
      tier     = optional(string)
      type     = string
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  })
  description = <<-EOT
 - `cognitive_account_id` - (Required) The ID of the Cognitive Services Account. Changing this forces a new resource to be created.
 - `name` - (Required) The name of the Cognitive Services Account Deployment. Changing this forces a new resource to be created.
 - `rai_policy_name` - (Optional) The name of RAI policy.
 - `version_upgrade_option` - (Optional) Deployment model version upgrade option. Possible values are `OnceNewDefaultVersionAvailable`, `OnceCurrentVersionExpired`, and `NoAutoUpgrade`. Defaults to `OnceNewDefaultVersionAvailable`. Changing this forces a new resource to be created.

 ---
 `model` block supports the following:
 - `format` - (Required) The format of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. Possible value is `OpenAI`.
 - `name` - (Required) The name of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created.
 - `version` - (Required) The version of Cognitive Services Account Deployment model.

 ---
 `scale` block supports the following:
 - `capacity` - (Optional) Tokens-per-Minute (TPM). The unit of measure for this field is in the thousands of Tokens-per-Minute. Defaults to `1` which means that the limitation is `1000` tokens per minute. If the resources SKU supports scale in/out then the capacity field should be included in the resources' configuration. If the scale in/out is not supported by the resources SKU then this field can be safely omitted. For more information about TPM please see the [product documentation](https://learn.microsoft.com/azure/ai-services/openai/how-to/quota?tabs=rest).
 - `family` - (Optional) If the service has different generations of hardware, for the same SKU, then that can be captured here. Changing this forces a new resource to be created.
 - `size` - (Optional) The SKU size. When the name field is the combination of tier and some other value, this would be the standalone code. Changing this forces a new resource to be created.
 - `tier` - (Optional) Possible values are `Free`, `Basic`, `Standard`, `Premium`, `Enterprise`. Changing this forces a new resource to be created.
 - `type` - (Required) The name of the SKU. Ex

 ---
 `timeouts` block supports the following:
 - `create` - (Defaults to 30 minutes) Used when creating the Cognitive Services Account Deployment.
 - `delete` - (Defaults to 30 minutes) Used when deleting the Cognitive Services Account Deployment.
 - `read` - (Defaults to 5 minutes) Used when retrieving the Cognitive Services Account Deployment.
 - `update` - (Defaults to 30 minutes) Used when updating the Cognitive Services Account Deployment.
EOT
  nullable    = false
}
