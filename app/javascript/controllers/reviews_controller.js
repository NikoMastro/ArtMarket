import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'form' ]

  connect() {
    console.log('Hello from reviews_controller.js')
    console.log(this.formTarget)
  }

  toggle(event) {
    event.preventDefault()
    console.log(this.formTarget);

    this.formTarget.classList.toggle("d-none")
  }
}
