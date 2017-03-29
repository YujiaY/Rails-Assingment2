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