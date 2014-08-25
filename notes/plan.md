Plan 
====

TO DO
Edit, Delete Cancan


- Get a quick solution working in command line to work out some logic.
- Remove turbolinks, remove jquery-rails
- Delete scaffold.css
- Add a gems
- bundle
- Plan rails associations:

```
World has_many :robots
Robot belongs_to :world
Robot has_many :moves
Move belongs_to :robot
```

- rails g scaffold world name x:integer y:integer
- rails g scaffold robot status:integer world:references
- rails g scaffold move orientation:string xcoordinate:integer xcoordinate:integer robot:references

- clean-up routes.rb file
- install jquery using bower

##Setup testing
- bundle exec rake db:drop db:create db:migrate bundle exec rake db:test:prepare
- rails g rspec:install
- mkdir spec/controllers 
- touch spec/controllers/worlds_controller_spec.rb
- touch spec/controllers/robots_controller_spec.rb
- touch spec/controllers/moves_controller_spec.rb
- require spec_helper in files
- describe controllers
- run bundle exec rspec 
- mkdir spec/models
- touch spec/models/world_spec.rb 
- touch spec/models/robot_spec.rb 
- touch spec/models/move_spec.rb

##Add some validation
- Adding validation to all the models

##Add rails admin
- gem 'rails_admin'
- rails g rails_admin:install
- TO FINISH

##Nested resources
- Move robots to world/:id/robots
- Move moves to world/:id/robots/:id/moves
- Update tests

##Brakeman
- $ brakeman
- Possible unprotected redirect near line 32: redirect_to((local world).find(+params[:id]+), :notice => "Robot was successfully created.")

##Views
- Create new _world partial
- Make basic navigation to help development

##CSS
- Delete scaffold CSS

##Streamline scaffold
- Remove moves/edit
- Remove moves/show

##DB
- Make default for status to be 1 (Deployed)

##Heroku
- Add favicon
- Fix secret_key_base issue by uncommenting config/secrets.yml from gitignore.