import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    document.addEventListener("keydown", this.handleEscape.bind(this));
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleEscape.bind(this));
  }

  open() {
    this.modalTarget.classList.remove("hidden");
  }
  close() {
    this.modalTarget.classList.add("hidden");
  }

  handleEscape(event) {
    if (event.key === "Escape" && !this.modalTarget.classList.contains("hidden")) {
      this.close();
    }
  }
}