# Why not using [RailsAdminImpersonate](https://github.com/astrails/rails_admin_impersonate)?

I found that the `rails_admin_impersonate` is missing an important feature, to allow Admin to sign out of the current impersonated user and restore the Admin session. It is a bit annoying to sign in after I have finished impersonating someone.

Using [Pretender gem](https://github.com/ankane/pretender) seems to be a solution, but integrating it with RailsAdmin is not straightforward (and no tutorial for doing that so far). This gem is for that purpose. It is inspired by [RailsAdminImpersonate](https://github.com/astrails/rails_admin_impersonate).

# RailsAdminPretender

Add an ability to [rails_admin](https://github.com/sferik/rails_admin) to impersonate as any user or actually any member
that is devise authenticatable.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin_pretender'

And then execute:

    $ bundle

## Usage

Add to your `config/initializers/rails_admin.rb` an action `impersonate` to actions:

    config.actions do
      # root actions
      dashboard                     # mandatory
      # collection actions
      index                         # mandatory
      new
      export
      history_index
      bulk_delete
      # member actions
      show
      edit
      delete
      history_show
      show_in_app
      impersonate
    end

At the bottom of `config/initializers/rails_admin.rb`, add the following line:

    RailsAdminPretender.init

Finally, in your `ApplicationController`, include the following module:

    include RailsAdminPretender


Now restart the application and visit User table in the admin. You should see home icon and Impersonate link for every model that uses Devise. In your views, you can use the helper `is_impersonating?` to check whether current_user is an impersonated user or not.

For example:

    <% if is_impersonating? %>
      <li class="nav-item">
        <%= link_to "Sign out of this user", stop_impersonating_path, method: :post, class: "nav-link" %>
      </li>
    <% else %>
      <li class="nav-item">
        <%= link_to "Sign out", destroy_user_session_path, method: :delete, class: "nav-link" %>
      </li>
    <% end %>

Note: by default impersonation is disabled for model `Admin`. If you want to
disable it for some other model you can modify the above code like this:

    config.actions do
      ...
      impersonate do
        authorized do
          'ModelName' != bindings[:abstract_model].model_name
        end
      end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

&copy; 2019 [Chien Tran]
