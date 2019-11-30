## Install Figaro

After cloning, you have to set up the environment variables with [Figaro](https://github.com/laserlemon/figaro). 

```
bundle exec figaro install
```

Then get the secret values from wherever they're securely stored. 

## Sync up production db 

```
heroku pg:backups:download
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d atwater_development latest.dump
```

## Visual regression testing 

[Using Wraith](http://bbc-news.github.io/wraith/)

## Load Heroku database 

We can't really seed things anymore because of schema changes. Instead, run: 

```
heroku pg:backups:download
rails db:drop
rails db:create
pg_restore latest.dump -d atwater_development
```