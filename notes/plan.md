Plan 
====

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
- rails g scaffold robot status:integer planet:references
- rails g scaffold move orientation:string xcoordinate:integer xcoordinate:integer robot:references

- clean-up routes.rb file
- install jquery using bower
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