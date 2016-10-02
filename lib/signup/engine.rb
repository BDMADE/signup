module Signup
  class Engine < ::Rails::Engine
    isolate_namespace Signup

    config.generators do |g|
      g.assets false
    end

    config.assets.paths << File.expand_path("../../assets/stylesheets", __FILE__)
    config.assets.paths << File.expand_path("../../assets/javascripts", __FILE__)

    config.assets.precompile += %w( user.scss )

    config.to_prepare do
      # Make the implementing application's helpers available to the engine.
      # This is required for the overriding of engine views and helpers to work correctly.
      Signup::ApplicationController.helper Rails.application.helpers
    end
  end
end
