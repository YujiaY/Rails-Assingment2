User.create(name: "lucas", email:"someemail2@example.com",password:"foobar", password_confirmation: "foobar")

userA = User.find(1)
userA.authenticate("wrongPassword")
userA.authenticate("foobar")


#origin
 <% if logged_in? %>
    <h1>Welcome, <%= current_user.name %>!</h1>
    <p>
    <% if current_user.name == "lucas" %>
  	<%= "Fake news:  You are an Admin!" %>
  	 <%= yield :admin %>
  	<% end %>
  		
  	</p>
  	<p>
  	<% if current_user.name.downcase.include? "s" %>
  	<%= "Fake news:  You are a Student!" %>

  	<% end %>
  		
  	</p>
  	<p>
  	<% if current_user.name.downcase.include? "l" %>
  	<%= "Fake news:  You are a Lecturer!" %>
  	<% end %>
    </p>

    ###



 <% if logged_in? %>
    <h1>Welcome, <%= current_user.name %>!</h1>
    <p>
    <% if current_user.name == "lucas" %>
  	  <%= "Fake news:  You are an Admin!" %>
  	  <%= yield :admin %>
  	      <% elsif  current_user.name.downcase.include? "s" %>
  	      	<%= "Fake news:  You are a Student!" %>
  	      
  	      <% elsif current_user.name.downcase.include? "l" %>
  	      	<%= "Fake news:  You are a Lecturer!" %>
  	<% end %>
    </p>

 ###

rails g migration AddRoleToUsers role:string


rails g migration ChangeColumnRoleDefaultToUsers :users, :role, from: nil, to: "student"

rake db:migrate

#Go to User.controller

    def user_params
      params.require(:user).permit(:name,:role)
    end
end