import { Controller } from "@hotwired/stimulus"
import { Toast } from 'bootstrap'

export default class extends Controller {
  connect() {
    this.toast = new Toast(
      document.getElementById('copyToast')
    )
  }

  show(e) {
    console.log(e.detail.content)
    this.toast.show()
  }
}
