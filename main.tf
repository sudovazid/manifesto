provider "google" {
  region = "us-central1"
  zone   = "us-central1-c"
  project     = var.project_id
}


# EDH manifesto table structure
resource "google_bigquery_table" "tbl_mfst" {
  dataset_id = var.dataset_id
  table_id = var.tbl_mfst

  time_partitioning {
    type = "DAY"
  }
      schema = <<EOF
    [
  {
    "name": "FILENAME",
    "type": "STRING",
    "mode": "NULLABLE",
    "maxLength": "100",
    "description": "Name of the specific extract file that is supplied alongside this manifest file.  "
  },
 {
    "name": "EXTRACT_DATE_TIME",
    "type": "DATETIME",
    "mode": "NULLABLE",
    "description": "Extract DateTime highlights the date that the extract was completed."
  },
 {
    "name": "RECORD_COUNT",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "A total count of the nuMber of records within the specific file (including header/trailers etc.). "
  }
]
   EOF
}