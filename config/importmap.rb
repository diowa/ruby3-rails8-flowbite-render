# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flowbite/dist/flowbite.turbo.min.js", to: "flowbite--dist--flowbite.turbo.min.js.js" # @3.1.2
pin "@fortawesome/fontawesome-free/svgs/solid/0.svg", to: "@fortawesome--fontawesome-free--svgs--solid--0.svg.js" # @6.7.2
pin "@fortawesome/fontawesome-free/svgs/brands/github.svg", to: "@fortawesome--fontawesome-free--svgs--brands--github.svg.js" # @6.7.2
