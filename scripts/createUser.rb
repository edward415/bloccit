 admin = User.new(
   name: 'Admin User',
   email: 'admin@example.com',
   password: 'helloworld',
   password_confirmation: 'helloworld')
 admin.skip_confirmation!
 admin.save
 admin.update_attribute(:role, 'admin')