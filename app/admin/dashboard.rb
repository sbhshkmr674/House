ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "-:Available Buildings-:" do
           ul do
             Building.all.map do |building|
               li link_to(building.image.url(:medium), admin_building_path(building))
             end
           end
         end
       end

       column do
        panel "Glaxy of User" do
            ul do 
                User.all.map do |user|
                    li link_to(user.user_name, admin_user_path(user))
                end
            end
        end
    end
       column do
        panel "Glaxy of Floor" do
            ul do
                Floor.all.map do |floor|
                    li link_to(floor.floor_name, admin_floor_path(floor))
                end
            end
        end
    end

        column do
            panel "Glaxy of Romm in a Building" do
                ul do 
                    Room.all.map do |room|
                        li link_to(room.image.url(:medium), admin_room_path(room))
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
  end # content
end
