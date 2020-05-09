## Get the Stripe API Keys

1. Test publishable key
2. Test secret key
3. Live publishable key
4. Live secret key 

*Stripe will only reveal your live secret key once, so be prepared to copy and store it immediately, or else you'll have to create a new one*

Store them in your [Rails credentials](https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336). 

## Create a view for the form

In my case, I have a `PagesController` at `app/controllers/pages_controller.rb.rb`, which I use to render specific static content. Adding a controller action goes something like: 

```rb
# app/controllers/pages_controller.rb
def pay 
end
```

And a corresponding view at `app/views/pages/pay.html.erb`.

Depending on your Rails setup, your process may vary. At the end of the day, you just need a place for the frontend of the payment form. However you add frontend features, do that. 

