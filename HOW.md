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