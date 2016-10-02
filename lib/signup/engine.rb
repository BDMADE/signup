module Signup
  class Engine < ::Rails::Engine
    isolate_namespace Signup

    config.generators do |g|
      g.assets false
    end

    config.assets.paths << File.expand_path("../../assets/stylesheets", __FILE__)
    config.assets.paths << File.expand_path("../../assets/javascripts", __FILE__)

    config.assets.precompile += %w( user.scss )
  end
end
