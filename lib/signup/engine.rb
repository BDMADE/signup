require 'bcrypt'
module Signup
  class Engine < ::Rails::Engine
    isolate_namespace Signup

    config.generators do |g|
      g.assets false
    end

    initializer 'signup.assets.precomple' do |app|
      app.config.assets.precompile += %w( signup.scss )
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
  end
end
