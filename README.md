Behavior
========

Behavior is a Ruby on Rails plugin for storing application configuration variables in the database. You can use it to store things like a Site's Title, description and keywords, or for user definable things like a currency exchange rate, or minimum and maximum values.

The benefits of storing configuration in the database are:

- End users can easily edit the values
- Configuration is decoupled from the codebase

This is particularly useful for open source projects, where application settings shouldn't be stored in source code.

It's designed to be as simple to use and get up and running, and to be flexible in that it's both end user and developer friendly.

Although all config variables are ultimately stored in the database, you can set sensible defaults in a configuration file in the source code.

Installation
============

Behavior is easy to install.

As a plugin:

    ./script/plugin install git://github.com/paulca/behavior.git

Or as a gem. Add this to your environment.rb:

    config.gem 'behavior'

Generate the migration and sample behavior.yml:

    ./script/generate behavior

And run the migration:

    rake db:migrate

Basic Usage
===========

There are two parts to how behavior works. First of all there is a config file, `config/behavior.yml`. This file controls the variables that are allowed to be set in the app.

For example, if you wanted to have access to a config variable "site_title", put this in behavior.yml:

    site_title:
      default:
  
Now, within your app controllers and views, you can access `config[:site_title]`. In your models, you can access `Behavior.config`.

If you want to update the config, call `config.update(:site_title => "My New Title")`

Web Interface
=============

behavior comes with a web interface that is available to your app straight away at `http://localhost:3000/admin/config`.

By default, this comes with no styling, but you can create a layout in `app/layouts/admin.html.erb`, or set a layout by setting `Behavior::Setting.layout`

For example, to use your standard application layout, create a `config/initializers/behavior.rb` like this:

    Behavior::Settings.layout = 'application'

You can also add before_filters to protect the controller from outsiders:

    Behavior::Settings.before_filters << 'require_admin_user'

If you want to control how the fields in the admin interface appear, you can add additional params in your behavior.yml file:

    site_title:
      name: Name of Your Site   # sets the edit label
      default: My Site          # sets the default value
      type: string              # uses input type="text"
  
    site_description:
      name: Describe Your Site  # sets the edit label
      default: My Site          # sets the default value
      type: text                # uses textarea
  
    secret:
      name: A Secret Passphrase # sets the edit label
      default: passpass         # sets the default value
      type: password            # uses input type="password"

Running the tests
=================

You can run the tests by checking out the code into vendor/plugins of a Rails app and running:

    rake

It also comes with a set of cucumber features:

    cucumber

About me
========

I'm Paul Campbell. I'm an avid Ruby on Rails web developer. Follow my ramblings at "http://www.pabcas.com":http://www.pabcas.com

Follow me on Twitter "http://twitter.com/paulca":http://twitter.com/paulca

Copyright (c) 2009 Paul Campbell, released under the MIT license