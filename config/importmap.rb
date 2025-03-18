# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "semantic-min", to: "https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"
pin "google-ajax", to: "https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"
