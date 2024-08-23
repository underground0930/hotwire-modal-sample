import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  connect() {
    console.log("Connected")
  }

  submitEnd(e){
    if(e.detail.success){
      this.closeModal()
    }
  }

  closeModal(){
    this.element.close()
  }
}
