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
rails db:migrate
pg_restore latest.dump -d atwater_development
```