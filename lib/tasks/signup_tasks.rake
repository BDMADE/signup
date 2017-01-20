# desc "Explaining what the task does"
namespace :signup do
  task :install do
    sh "sudo sed -i '/protect_from_forgery with: :exception/a\
             include Signup::UsersHelper' app/controllers/application_controller.rb"
    sh 'echo Signup::Engine.load_seed >> db/seeds.rb'
    sh 'rake db:migrate'
    sh 'rake db:seed'
    sh 'clear'
  end
end

