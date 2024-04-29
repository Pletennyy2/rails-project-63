### Hexlet tests and linter status:
[![Actions Status](https://github.com/Pletennyy2/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Pletennyy2/rails-project-63/actions)

### CI:
[![CI](https://github.com/Pletennyy2/rails-project-63/actions/workflows/ci.yml/badge.svg)](https://github.com/Pletennyy2/rails-project-63/actions)

# HexletCode
This is a gem HTML-form generator to simplify the creation of html forms when working with html templates. 
Save your time when developing web applications


## Installation

Add this gem to your Ruby on Rails application's Gemfile. Specify it in the Gemfile under the gem section like this:

```gem 'hexlet_code', path: 'path_to_your_hexlet_code_gem'```

After that, run the bundle install command in the terminal to install the hexlet_code gem in your application.

Then, you can use the form_for method and other methods from the HexletCode module in your Ruby on Rails controllers and views

## Usage

Here is how you can use your code in the UsersController to create a form in the new.html.erb view:

```
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
    @form_html = HexletCode.form_for(@user, url: users_path) do |f|
      f.input :name, placeholder: 'Enter your name'
      f.input :email, type: 'email', placeholder: 'Enter your email'
      f.submit
    end
  end
end 
```

``` 
<!-- app/views/users/new.html.erb -->
<h1>New User</h1>

<%= @form_html %>
```
In this example, the UsersController creates a new instance of a user @user and generates a form using the HexletCode.form_for method. The form will contain two input fields for name and email, as well as a submit button. The new.html.erb view then displays the generated form on the page.




