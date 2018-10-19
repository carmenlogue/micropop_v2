if User.where(email: 'admin@micropop.com').none?
  kyan_admin = User.new(
    email:              'admin@micropop.com',
    encrypted_password: ENV['ADMIN_PASS'],
  )
  kyan_admin.save(validate: false)
end
