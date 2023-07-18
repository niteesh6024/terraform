provider "grafana" {
  url      = "http://<grafana-host>:<grafana-port>"
  token    = "<grafana-api-token>"
  insecure = true
}

resource "grafana_data_source" "gcp_monitoring" {
  name                   = "Google Cloud Monitoring"
  type                   = "cloudmonitoring"
  access_mode            = "proxy"
  url                    = "https://monitoring.googleapis.com"
  jsonData {
    project_id = "tensile-rite-392704"
    token_path = "key.json"
  }
}

resource "grafana_data_source" "gcp_bigquery" {
  name                   = "Google Cloud BigQuery"
  type                   = "cloudgooglebigquery"
  access_mode            = "proxy"
  url                    = "https://bigquery.googleapis.com"
  jsonData {
    project_id     = "<your-gcp-project-id>"
    dataset        = "<your-bigquery-dataset>"
    location       = "<desired-bigquery-location>"
    token_path     = "<path-to-service-account-key-file>"
  }
}



provider "grafana" {
  url      = "http://<grafana-host>:<grafana-port>"
  token    = "<grafana-api-token>"
  insecure = true
}

resource "grafana_data_source" "gcp_monitoring" {
  name                   = "Google Cloud Monitoring"
  type                   = "cloudmonitoring"
  access_mode            = "proxy"
  url                    = "https://monitoring.googleapis.com"
  google_application_credentials = "<path-to-service-account-key-file>"
}
