import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validation"
export default class extends Controller {
  static targets = ["errorMessage", "input"]

  validate(event){
    event.preventDefault()

    fetch("/post/validate", {
      method: "POST",
      headers: {"Accept": "application/json", "X-CSRF-Token": this.#getMetaValue("csrf-token") },
      body: new FormData(this.inputTarget)
    })
    .then(response => response.json())
    .then((data) => {
      this.errorMessageTarget.innerHTML = ""
      this.errorMessageTarget.insertAdjacentHTML('beforeend', data.message)
    })
  }

  connect() {
    
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
