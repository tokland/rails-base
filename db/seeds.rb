logger = Logger.new(STDERR)

admin_user = AdminUser.find_or_create!([:email], {
  :email => "pyarnau@gmail.com",
  :password => "123123",
  :password_confirmation => "123123",
})
logger.info("AdminUser##{admin_user.id} created: #{admin_user.email}/123123")

user = User.find_or_create!([:email], {
  :email => "pyarnau@gmail.com",
  :password => "123123",
  :password_confirmation => "123123",
})
logger.info("User##{user.id} created: #{user.email}/123123")

page = Page.find_or_create!([:key], {
  :key => "help",
  :language => "es",
  :state => "published",
  :slug => "help",
  :title => "Help",
  :body => "Help *body*",
})
logger.info("Page##{page.id} created: #{page.key}") 
