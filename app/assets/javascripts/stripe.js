document.addEventListener("turbolinks:load", function () {
  var stripe;
  var elements;
  var card;
  var paymentForm = document.getElementById("paymentForm");
  if (paymentForm) {
    initializeStripe();
    paymentForm.addEventListener("submit", handlePaymentSubmit);
  }
});

function initializeStripe() {
  var publishableKey = document.getElementsByName("stripePublishableKey")[0]
    .content;
  stripe = Stripe(publishableKey);
  elements = stripe.elements();

  // Set up Stripe.js and Elements to use in checkout form
  var style = {
    base: {
      color: "#32325d",
    },
  };

  card = elements.create("card", { style: style });
  card.mount("#card-element");
}

function handlePaymentSubmit(event) {
  event.preventDefault();
  var formData = {
    email: document.getElementById("email").value,
    invoice: document.getElementById("invoice").value,
    amount: document.getElementById("amount").value * 100,
  };
  var token = document.getElementsByName("csrf-token")[0].content;
  console.log(token);

  fetch("/payment_intents", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": token,
    },
    body: JSON.stringify(formData),
  })
    .then((response) => response.json())
    .then((data) => {
      console.log("Success:", data);
      submitPaymentIntentToStripe(data);
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

function submitPaymentIntentToStripe(paymentIntent) {
  var clientSecret = paymentIntent.client_secret;
  var name = document.getElementById("name").value;
  stripe
    .confirmCardPayment(clientSecret, {
      payment_method: {
        card: card,
        billing_details: {
          name: name,
        },
      },
    })
    .then(function (result) {
      if (result.error) {
        // Do some error
        console.log(result.error.message);
      } else {
        if (result.paymentIntent.status === "succeeded") {
          // Do some sort of successmessage
        }
      }
    });
}
