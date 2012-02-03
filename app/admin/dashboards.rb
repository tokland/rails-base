ActiveAdmin::Dashboards.build do
  section "Recent created users" do
    table_for User.order("created_at DESC").limit(10) do
      column("Email") { |user| link_to(user.email, admin_user_path(user)) }
      column("Created at") { |user| I18n.localize(user.created_at, :format => :long) }
    end
  end

  section "Recent updated users" do
    ul do
      User.order("updated_at DESC").map do |user|
        li link_to(user.email, admin_user_path(user))
      end
    end
  end

  #   section "Recent Posts", :priority => 10, :if => :some_test?
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
end
