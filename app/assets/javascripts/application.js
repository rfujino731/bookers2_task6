// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery 
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

function user_book_2(){
            const str = document.getElementById("pullsearch").value;

            if(str=="user"){
                document.getElementById("span").textContent = "No.1:" + str;

				// <%= form_with url: user_search_users_path, method: :get, local: true do |f| %>
				// <%= f.text_field :name %>
				// <%= f.submit :search %>
				// <% end %>

            }else if(str == "book"){
                document.getElementById("span").textContent = "No.2:" + str;
            }
        }


		// <%= form_with url: user_search_users_path, method: :get, local: true do |f| %>
		// 		<%= f.text_field :name %>
		// 		<%= f.submit :search %>
		// 		<% end %>



		// <%= form_with url: book_search_books_path, method: :get, local: true do |f| %>
		// 		<%= f.text_field :title %>
		// 		<%= f.submit :search %>
		// 		<% end %>


