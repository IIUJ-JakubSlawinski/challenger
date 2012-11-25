class HomeController < ApplicationController
  def index
    #@users = User.all
    #if @users.empty?
      for i in 0..10
        user = User.new  do |u|
        end
        user.email = "#{i}#{Time.now.getutc}@wp.pl"
        user.name = i
        #user.password = i
        #user.password_confirmation = i
        user.created_at = Time.now.round(1.minute)
        #@user.updated_at = Time.now
        user.save(:validate => false)
      end

      @users = User.all
    #end
    #@users = @users.group_by{|u| u.created_at.to_s[0,19]}
    #@users.each{|t, u| @users[t] = @users[t].length}
      @amusers = @users.group_by{|u| u.created_at.to_s[0,19]}.values.map{|x| {date: "#{DateTime.parse(x.first.created_at.to_s[0,20]).to_i}000".to_i, value: x.length}}
      @users = @users.group_by{|u| u.created_at.to_s[0,19]}.values.map{|x| ["#{DateTime.parse(x.first.created_at.to_s[0,20]).to_i}000".to_i, x.length]}

      @users.as_json
  end
end
