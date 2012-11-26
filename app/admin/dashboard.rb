ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span "Welcome to Active Admin. This is the default dashboard page."
    #    small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
    #  end
    #end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
       column do
         panel "Recent Users" do
           ul do
             #find(:all,
             #     :include => :comments,
             #     :conditions => ['comments.created_at > ?', 5.minutes.ago])
             User.all(:order => "created_at desc", :limit => 5).map do |user|
               li link_to(user.name, admin_user_path(user))
             end
           end
         end
       end

       column do
         panel "Info" do
           para "Welcome to ActiveAdmin."
         end
       end
    end

    columns do
      column do
        panel "Registered Users" do
          users = User.all
          am_users = users.group_by { |u| u.created_at.to_s[0, 19] }.values.map { |x| {date: "#{DateTime.parse(x.first.created_at.to_s[0, 20]).to_i}000".to_i, value: x.length} }
          users = users.group_by { |u| u.created_at.to_s[0, 19] }.values.map { |x| ["#{DateTime.parse(x.first.created_at.to_s[0, 20]).to_i}000".to_i, x.length] }

          render('/admin/dashboard/registration_chart', :am_users => am_users, :users => users)
        end
      end
    end
  end # content
end
