variable "kind" {
  type        = string
  description = "(Required) Specifies the type of Cognitive Service Account that should be created. Possible values are `Academic`, `AnomalyDetector`, `Bing.Autosuggest`, `Bing.Autosuggest.v7`, `Bing.CustomSearch`, `Bing.Search`, `Bing.Search.v7`, `Bing.Speech`, `Bing.SpellCheck`, `Bing.SpellCheck.v7`, `CognitiveServices`, `ComputerVision`, `ContentModerator`, `CustomSpeech`, `CustomVision.Prediction`, `CustomVision.Training`, `Emotion`, `Face`, `FormRecognizer`, `ImmersiveReader`, `LUIS`, `LUIS.Authoring`, `MetricsAdvisor`, `OpenAI`, `Personalizer`, `QnAMaker`, `Recommendations`, `SpeakerRecognition`, `Speech`, `SpeechServices`, `SpeechTranslation`, `TextAnalytics`, `TextTranslation` and `WebLM`. Changing this forces a new resource to be created."
  nullable    = false
}

variable "sku_name" {
  type        = string
  description = "(Required) Specifies the SKU Name for this Cognitive Service Account. Possible values are `F0`, `F1`, `S0`, `S`, `S1`, `S2`, `S3`, `S4`, `S5`, `S6`, `P0`, `P1`, `P2`, `E0` and `DC0`."
  nullable    = false
}

variable "custom_question_answering_search_service_id" {
  type        = string
  default     = null
  description = "(Optional) If `kind` is `TextAnalytics` this specifies the ID of the Search service."
}

variable "custom_question_answering_search_service_key" {
  type        = string
  default     = null
  description = "(Optional) If `kind` is `TextAnalytics` this specifies the key of the Search service."
  sensitive   = true
}

variable "custom_subdomain_name" {
  type        = string
  default     = null
  description = "(Optional) The subdomain name used for token-based authentication. This property is required when `network_acls` is specified. Changing this forces a new resource to be created."
}

variable "dynamic_throttling_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Whether to enable the dynamic throttling for this Cognitive Service Account."
}

variable "fqdns" {
  type        = list(string)
  default     = null
  description = "(Optional) List of FQDNs allowed for the Cognitive Account."
}

variable "identity" {
  type = object({
    identity_ids = optional(set(string))
    type         = string
  })
  default     = null
  description = <<-EOT
 - `identity_ids` - (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Cognitive Account.
 - `type` - (Required) Specifies the type of Managed Service Identity that should be configured on this Cognitive Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both).
EOT
}

variable "local_auth_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Whether local authentication methods is enabled for the Cognitive Account. Defaults to `true`."
}

variable "metrics_advisor_aad_client_id" {
  type        = string
  default     = null
  description = "(Optional) The Azure AD Client ID (Application ID). This attribute is only set when kind is `MetricsAdvisor`. Changing this forces a new resource to be created."
}

variable "metrics_advisor_aad_tenant_id" {
  type        = string
  default     = null
  description = "(Optional) The Azure AD Tenant ID. This attribute is only set when kind is `MetricsAdvisor`. Changing this forces a new resource to be created."
}

variable "metrics_advisor_super_user_name" {
  type        = string
  default     = null
  description = "(Optional) The super user of Metrics Advisor. This attribute is only set when kind is `MetricsAdvisor`. Changing this forces a new resource to be created."
}

variable "metrics_advisor_website_name" {
  type        = string
  default     = null
  description = "(Optional) The website name of Metrics Advisor. This attribute is only set when kind is `MetricsAdvisor`. Changing this forces a new resource to be created."
}

variable "network_acls" {
  type = object({
    default_action = string
    ip_rules       = optional(set(string))
    virtual_network_rules = optional(set(object({
      ignore_missing_vnet_service_endpoint = optional(bool)
      subnet_id                            = string
    })))
  })
  default     = null
  description = <<-EOT
 - `default_action` - (Required) The Default Action to use when no rules match from `ip_rules` / `virtual_network_rules`. Possible values are `Allow` and `Deny`.
 - `ip_rules` - (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Cognitive Account.

 ---
 `virtual_network_rules` block supports the following:
 - `ignore_missing_vnet_service_endpoint` - (Optional) Whether ignore missing vnet service endpoint or not. Default to `false`.
 - `subnet_id` - (Required) The ID of the subnet which should be able to access this Cognitive Account.
EOT
}

variable "outbound_network_access_restricted" {
  type        = bool
  default     = null
  description = "(Optional) Whether outbound network access is restricted for the Cognitive Account. Defaults to `false`."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Whether public network access is allowed for the Cognitive Account. Defaults to `true`."
}

variable "qna_runtime_endpoint" {
  type        = string
  default     = null
  description = "(Optional) A URL to link a QnAMaker cognitive account to a QnA runtime."
}

variable "storage" {
  type = list(object({
    identity_client_id = optional(string)
    storage_account_id = string
  }))
  default     = null
  description = <<-EOT
 - `identity_client_id` - (Optional) The client ID of the managed identity associated with the storage resource.
 - `storage_account_id` - (Required) Full resource id of a Microsoft.Storage resource.
EOT
}

variable "timeouts" {
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default     = null
  description = <<-EOT
 - `create` - (Defaults to 30 minutes) Used when creating the Cognitive Service Account.
 - `delete` - (Defaults to 30 minutes) Used when deleting the Cognitive Service Account.
 - `read` - (Defaults to 5 minutes) Used when retrieving the Cognitive Service Account.
 - `update` - (Defaults to 30 minutes) Used when updating the Cognitive Service Account.
EOT
}
