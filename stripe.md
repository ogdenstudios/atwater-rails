## Get the Stripe API Keys

1. Test publishable key
2. Test secret key
3. Live publishable key
4. Live secret key 

*Stripe will only reveal your live secret key once, so be prepared to copy and store it immediately, or else you'll have to create a new one*

Store them in your [Rails credentials](https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336). 

## Add the Stripe Keys to Rails config 

One of my favorite tricks with Rails is [setting custom configuration](https://blog.arkency.com/custom-application-configuration-variables-in-rails-4-and-5/). So I set up config varaibles in `config/environments/development.rb` and `config/environments/production.rb` for stripe, like so: 

```rb
# config/environments/development.rb

# . . . existing configuration

# Custom stripe config
config.x.stripe.publishable_key = Rails.application.credentials.stripe[:test_publishable_key]
config.x.stripe.secret = Rails.application.credentials.stripe[:test_secret_key]
```

```rb
# config/environments/production.rb

# . . . existing configuration

# Custom stripe config
config.x.stripe.publishable_key = Rails.application.credentials.stripe[:live_publishable_key]
config.x.stripe.secret = Rails.application.credentials.stripe[:live_secret_key]
``` 

And now in any of our views or controllers, we can access the appropriate test or live key by using: 

```rb
Rails.configuration.x.stripe.publishable_key
Rails.configuration.x.stripe.secret 
```

## Create a view for the form

In my case, I have a `PagesController` at `app/controllers/pages_controller.rb.rb`, which I use to render specific static content. Adding a controller action goes something like: 

```rb
# app/controllers/pages_controller.rb
def pay 
end
```

And a corresponding view at `app/views/pages/pay.html.erb`, along with the route updates in `config/routes.rb`.

Depending on your Rails setup, your process may vary. At the end of the day, you just need a place for the frontend of the payment form. However you add frontend features, do that. 

## Add Stripe Elements 

In `app/views/layouts/application.html.erb`, I edit my `head` element and add: 

```html
<script src="https://js.stripe.com/v3/"></script>
<meta name="stripePublishableKey" content="<%= Rails.configuration.x.stripe.publishable_key %>">
```

This loads the Stripe Elements JavaScript, along with the publishable key for the environment, which we'll use in the next step.

## Initiate Stripe Elements on the client

I create `app/assets/javascripts/stripe.js` and initialize Stripe Elements like so: 

```js
document.addEventListener("turbolinks:load", function () {
    initializeStripe();
});

function initializeStripe() {
  var publishableKey = document.getElementsByName("stripePublishableKey")[0].content;
  var stripe = Stripe(publishableKey);
  var elements = stripe.elements();
}
```

This instantiates Stripe and Stripe Elements, using the publishable key supplied by the Rails environment. 


## Write the view 

Now I write the form, I'm going to require: 

* Name 
* Email 
* Invoice number
* Payment amount

That form looks like this: 

```html
<div id="paymentForm">
  <form>
    <fieldset>
      <div>
        <label for="name">Name*</label>
        <input
          id="name"
          type="text"
          placeholder="Jane Doe"
          required=""
          autocomplete="name"
        />
      </div>
      <div>
        <label for="email">Email*</label>
        <input
          id="email"
          type="email"
          placeholder="janedoe@gmail.com"
          required=""
          autocomplete="email"
        />
      </div>
      <div>
        <label for="phone">Phone*</label>
        <input
          id="phone"
          type="tel"
          placeholder="(941) 555-0123"
          required=""
          autocomplete="tel"
        />
      </div>
      <div>
        <label for="invoice">Invoice*</label>
        <input
          id="invoice"
          type="text"
          placeholder="Invoice number"
          required=""
          autocomplete="name"
        />
      </div>
      <div>
        <label for="amount">Amount (USD)*</label>
        <input
          id="amount"
          type="tel"
          placeholder="100.00"
          required=""
          autocomplete="tel"
          pattern="(?=.*?\d)^\$?(([1-9]\d{0,2}(\d{3})*)|\d+)?(\.\d{1,2})?$"
        />
      </div>
    </fieldset>
    <fieldset>
      <div>
        <div id="card-element"></div>
      </div>
    </fieldset>
    <button type="submit">Pay</button>
  </form>
</div>
```

The only clever thing here is the pattern for amount, which allows numbers with or without a decimal. Any number with a decimal is limited to two decimal places, and commas are not allowed. 

## Mount the Stripe Elements

Stripe Elements needs to mount to an object in the DOM. Update your `initializeStripe()` function like so: 

```js
function initializeStripe() {
  var publishableKey = document.getElementsByName("stripePublishableKey")[0]
    .content;
  var stripe = Stripe(publishableKey);
  var elements = stripe.elements();

  // Set up Stripe.js and Elements to use in checkout form
  var style = {
    base: {
      color: "#32325d",
    },
  };

  var card = elements.create("card", { style: style });
  card.mount("#card-element");
}
```

## Write the form request

Now I've got a form that accepts the information I want and renders Stripe Elements. Next up, I want to hook into the form's `submit` event to make the payment. 

In `app/assets/javascripts/stripe.js`, I check for the `#paymentForm` element and add an event listener: 

```js
document.addEventListener("turbolinks:load", function () {
  var paymentForm = document.getElementById('paymentForm');
  if (paymentForm) {
    initializeStripe();
    paymentForm.addEventListener('submit', handlePaymentSubmit);
  }
});
```

And then write a `handlePaymentSubmit()` function which will send the form data and create a [payment intent](https://stripe.com/docs/payments/payment-intents) through my Rails backend. 

If the payment intent is successfully created, I send that to Stripe. And finally, if Stripe accepts the intent, I render a success message for my user. 

If neither of those happens, I render some error message.

## The backend

I create a controller at `app/controllers/payment_intents_controller.rb`, with only one method: `create`. To start, it looks like this: 

```rb
class PaymentIntentsController < ApplicationController
    def create
    end
end
```

In `config/routes.rb`, I set up the resource, with only the `create` method available:

```rb
# . . . other config above
resources :payment_intents, only: [:create]
```

## Create the payment intent 

In that `create` method, I set up the `Stripe` api key using `Rails.configuration.x.stripe.secret`, which will select the correct test or live key depending on my environment. 

Then I create a [payment intent]() using Stripe's API. I set the amount, the currency, the invoice number, and a receipt email, accepted from the parameters. 

After that, I return a JSON response with the payment intent information. All in all, the entire controller looks like this: 

```rb
class PaymentIntentsController < ApplicationController
    def create
        Stripe.api_key = Rails.configuration.x.stripe.secret
        @intent = Stripe::PaymentIntent.create({
            amount: params[:amount],
            currency: 'usd',
            metadata:{
                invoice: params[:invoice]
            },
            receipt_email: params[:email]
        })
        render json: @intent
    end
end 
```

## Add the Stripe gem to your project

```rb
# Gemfile
gem 'stripe'
```

Then run `bundle` in the project to install. 