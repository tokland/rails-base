module Senergy
  module AppHelpers
    def seed_database
      {
        pages: {
          help: FactoryGirl.create(:published_page, {
            title: "Help title",
            key: "help-key",
            slug: "help-slug",
          })
        }
      }
    end
  end
end
