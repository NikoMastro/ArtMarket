import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'form' ]

  connect() {
    console.log('Hello from reviews_controller.js')
    // console.log(this.testTarget)
  }

  toggle(event) {
    event.preventDefault()
    this.formTarget.classList("d-none")
  }
}
