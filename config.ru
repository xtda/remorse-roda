require_relative './config/boot'

run(App.development? ? Unreloader : App.freeze.app)