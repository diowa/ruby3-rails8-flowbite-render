# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flowbite/dist/flowbite.turbo.min.js", to: "flowbite--dist--flowbite.turbo.min.js.js" # @3.1.1
pin "@fortawesome/fontawesome-free/svgs/solid/0.svg", to: "@fortawesome--fontawesome-free--svgs--solid--0.svg.js" # @6.7.2
pin "@fortawesome/fontawesome-free/svgs/brands/github.svg", to: "@fortawesome--fontawesome-free--svgs--brands--github.svg.js" # @6.7.2
pin "easymde/src/js/easymde.js", to: "easymde--src--js--easymde.js.js" # @2.17.0
pin "@highlightjs/cdn-assets/es/core.min.js", to: "@highlightjs--cdn-assets--es--core.min.js.js" # @11.10.0
pin "highlight.js" # @11.10.0
