Rails.configuration.stripe = {
  :publishable_key => :pk_test_STljFw2GSWE06P2U8C2tlaQk,
  :secret_key      => :sk_test_93dciN5bCSG8pBzCaqX0TtnV
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]