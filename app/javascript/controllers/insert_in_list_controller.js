import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
  }

  send(event) {
    event.preventDefault(); // Prevent the default form submission behavior

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => {
        if (!response.ok) {
          throw new Error(`Network response was not ok: ${response.statusText}`);
        }
        return response.json();
      })
      .then((data) => {
        if (data.inserted_item) {
          // Insert the new item dynamically at the end of the itemsTarget
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        if (data.form) {
          // Replace the form with the updated one from the response
          this.formTarget.outerHTML = data.form
        }
      })
      .catch(error => {
        console.error("There was a problem with the fetch operation:", error);
      });
  }
}
