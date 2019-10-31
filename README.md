## Sync up production db 

```
heroku pg:backups:download
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d atwater_development latest.dump
```