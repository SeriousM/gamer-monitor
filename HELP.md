## Rails

- Create new rails project  
`rails new <name>`

- Generate Scaffold (Model, Controller, Methods, etc.)  
`rails generate scaffold <modelname> [<property>:<type> <property>:<type>]`

- Generate / Destroy Controller + Methods  
`rails generate controller <name> [<method> <method>] [--no-test-framework]`  
`rails destroy controller <name> [<method> <method>]`

`--no-test-framework` will skip the generation of default RSpec tests for the controller

- Generate Integration Tests  
`rails generate integration_test <controller name>`

- Generate / Destroy Model  
`rails generate model <modelname> [<property>:<type> <property>:<type>]`  
`rails destroy model <modelname>`

- Start local Web Server  
`rails server`

- Updating rails  
`gem update rails` to trigger system wide rails update.  
update Gemfile with new rails version eg. `gem 'rails', '3.2.9'` and run `bundle install` to get the new version.  
run `bundle exec rake rails:update` to let rails check your files for compatibility.  

## Database

- Migrate Database Changes  
`rake db:migrate`

- Rollback single Database migration step  
`rake db:rollback`

- Rollback to the first Database version  
`rake db:migrate VERSION=0`

## Git

- Add content to Git  
`git add .`

- Commit added content to Git  
`git commit -m "<message>"`

- Push committed content to GitHub  
`git push origin <branch>`

## Heroku

- Install Heroku (action.io has it already!)  
[https://toolbelt.heroku.com/](https://toolbelt.heroku.com/)  
OBSOLETE --> `gem install heroku`  

- Creating local SSH Key for Heroku  
[https://devcenter.heroku.com/articles/keys#adding_keys_to_heroku](https://devcenter.heroku.com/articles/keys#adding_keys_to_heroku)  
 - If windows complains about failing creation:  
[http://stackoverflow.com/a/2840909/660428](http://stackoverflow.com/a/2840909/660428)

- Add ssh keys to Heroku  
`heroku keys:add`

- Initialize Heroku Page  
`heroku create --stack cedar`

- Push committed content to Heroku  
`git push heroku <branch>`

- Open Heroku Site after push  
`heroku open`

- Login into Heroku  
`heroku login`

- Adding a heroku remote (after login)  
`git remote add heroku git@heroku.com:<name of heroku slot>.git`

(actually it would be `git remote add heroku git@heroku.com:stormy-bayou-8492.git`)

- Run Heroku interactive console  
`heroku run console`

## Rails Bundler

- Installing Gems defined in Gemfile  
`bundle install`

- Starting Guard + Spork service (unit testing like ncrunch, already configurated)  
`bundle exec guard`

- Start unit test by hand  
`bundle exec rspec [<full or partial path>]`

## Tools

- Good Windows Console Replacement  
[http://code.google.com/p/conemu-maximus5/](http://code.google.com/p/conemu-maximus5/) [http://alternativeto.net/software/conemu/](http://alternativeto.net/software/conemu/)

- Nice text editor  
[http://www.sublimetext.com/](http://www.sublimetext.com/)

- Markdown editor  
[http://markdownpad.com/](http://markdownpad.com/)

- CI Server Travis  
[https://travis-ci.org/](https://travis-ci.org/)

- CI Server Drone.IO  
[https://drone.io/](https://drone.io/)

## Cloud9 IDE   
[c9.io](https://c9.io/)

- Running a ruby server on cloud9  
[https://docs.c9.io/running_a_rails_app.html](https://docs.c9.io/running_a_rails_app.html)  
`rails s -b $IP -p $PORT` -> [http://ruby-sample-app.seriousm.c9.io/](http://ruby-sample-app.seriousm.c9.io/)

- Kill hanging process  
search for hanging process id with `ps aux`  
kill the process with `kill -9 <PID>`

- Environment Variables  
`printenv` to display them, $NAME to use. $NAME is case sensitive!

## Troubleshooting

- `different prefix: "D:/" and "X:/....."`
Just use the command line `bundle install --path .bundle` as described [here](https://github.com/thomas-mcdonald/bootstrap-sass/issues/96#issuecomment-7355131)  

- No colors in git commands like `git status` or `git diff`
[http://thomashunter.name/blog/git-colored-output-shortcut-commands-autocompletion-and-bash-prompt/](http://thomashunter.name/blog/git-colored-output-shortcut-commands-autocompletion-and-bash-prompt/)  

- guard wont get triggered when file changes
use the switch `--force-polling` like `guard start --force-polling` [https://github.com/guard/guard#-p--force-polling-option](https://github.com/guard/guard#-p--force-polling-option)  
this is usually needed on action.io platforms.  

- `undefined method '[]' for nil:NilClass`
make sure that the target machine runs at least `ruby 1.9.3`. info here: [http://mongoid.org/en/mongoid/docs/tips.html](http://mongoid.org/en/mongoid/docs/tips.html)  