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
- rake db:create db:migrate