We go to use this guid: https://guides.rubyonrails.org/engines.html
for create engine with articles...

> Create engine
    
    rails plugin new blorgh --mountable

> Generate articles scaffold 

    bin/rails generate scaffold article title:string text:text

> Star the projetc

    bin/rails db:migrate

    - In test/dummy folder: bin/rails server

    url: http://localhost:3000/blorgh/articles or http://localhost:3000/blorgh

> Add comments to articles

- Generate a model for comments

    bin/rails generate model Comment article_id:integer text:text

-  Migrate

    bin/rails db:migrate

- add other code to show comments ( see page)

- Generate controller for comments

    rails generate controller comments

> Connect to project

    - Get or create a project ( rails new unicorn )

    - Add to routes.rb: gem 'blorgh', path: 'engines/blorgh'

    - run: bundle

    -Mount in unicor project Routes: mount Blorgh::Engine, at: "/blog"

> Setup engine in project

    - It will copy migrations: bin/rails blorgh:install:migrations
    or
    copy all migrations ** : bin/rails railties:install:migrations

    bin/rails db:migrate
    -  f you would like to run migrations only from one engine, you can do it by specifying SCOPE:
        bin/rails db:migrate SCOPE=blorgh
    
    bin/rails server    


Notes:

> Errors:

    - Sprockets::Rails::Helper::AssetNotPrecompiled in Blorgh::Articles#index, solution:
        config/initializers/assets.rb
        Rails.application.config.assets.precompile += %w( blorgh/application.css )


<!-- Next part: Using a Class Provided by the Application -->


- First, the author_name text field needs to be added to the app/views/blorgh/articles/_form.html.erb partial inside the engine. ...


> author_id column added to the blorgh_articles table

    bin/rails generate migration add_author_id_to_blorgh_articles author_id:integer

- often engine controllers need to access methods in the main application's ApplicationController. An easy way to provide this access is to change the engine's scoped ApplicationController

    app/controllers/blorgh/application_controller.rb

    module Blorgh
        class ApplicationController < ::ApplicationController
        end
    end


> The next step is to make the class that represents a User in the application customizable for the engine.

    - lib/blorgh.rb

        mattr_accessor :author_class

    -  app/models/blorgh/article.rb

        belongs_to :author, class_name: Blorgh.author_class.to_s
        
        ...

        self.author = Blorgh.author_class.constantize.find_or_create_by(name: author_name)