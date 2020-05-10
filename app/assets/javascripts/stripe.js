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
  displayPaymentStatus();

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
      updatePaymentStatus(error);
    });
}

function displayPaymentStatus() {
  var paymentModal = document.getElementById("paymentModal");
  paymentModal.style.display = "block";
}

function updatePaymentStatus(status) {
  var message = document.getElementById("message");
  var loader = document.getElementsByClassName("loader")[0];
  var closeButton = document.getElementById("closeButton");
  message.innerText = status;
  loader.style.display = "none";
  closeButton.style.display = "block";
  closeButton.addEventListener("click", function () {
    var paymentModal = document.getElementById("paymentModal");
    paymentModal.style.display = "none";
    message.innerText = "Payment processing";
    loader.style.display = "block";
    closeButton.style.display = "none";
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
        updatePaymentStatus(result.error.message);
      } else {
        if (result.paymentIntent.status === "succeeded") {
          // Do some sort of successmessage
          var message = "Payment successful! Check your email for a receipt.";
          updatePaymentStatus(message);
          clearForm();
        }
      }
    });
}

function clearForm() {
  document.getElementById("paymentForm").querySelector("form").reset();
}
