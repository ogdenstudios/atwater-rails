class AddAdminUser < SeedMigration::Migration
  def up
    User.create!(:email => 'faithgh731@gmail.com', :password => ENV["ADMIN_PASSWORD"], :password_confirmation => ENV["ADMIN_PASSWORD"], :admin_rights => true)
  end

  def down
    User.find_by(email: "faithgh731@gmail.com").delete
  end
end
