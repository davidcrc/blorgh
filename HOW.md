We go to use this guid: https://guides.rubyonrails.org/engines.html
for create engine with articles...

> Create engine
    
    rails plugin new blorgh --mountable

> Generate articles scaffold 

    bin/rails generate scaffold article title:string text:text

> Star the projetc

    bin/rails db:migrate

    - In test/dummy folder: bin/rails serveren 

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


