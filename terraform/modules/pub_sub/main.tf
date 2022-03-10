
resource "google_pubsub_topic" "pub_sub" {
  name = "localize-topic"
}

resource "google_pubsub_subscription" "pub_sub_pull" {
  name  = "localize-subscription"
  topic = google_pubsub_topic.pub_sub.name

  ack_deadline_seconds = 20

  labels = {
    foo = "bar"
  }
}