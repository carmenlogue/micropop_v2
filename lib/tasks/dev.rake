namespace :dev do
  desc 'Creates sample data for local development'
  task prime: 'db:setup' do
    puts 'Creating development data...'
    unless Rails.env.development?
      raise 'This task can only be run in the development environment'
    end

    create_user('admin@example.com')

    puts 'Done'
  end

  def create_user(email)
    User.create!(
      email:                 email,
      password:              'password',
      password_confirmation: 'password'
    )
  end
end
