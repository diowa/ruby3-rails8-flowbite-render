# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.16
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.13
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @8.0.201
pin "flowbite/dist/flowbite.turbo.js", to: "flowbite--dist--flowbite.turbo.js.js" # @3.1.2
pin "flowbite/dist/flowbite.turbo.min.js", to: "flowbite--dist--flowbite.turbo.min.js.js" # @3.1.2
