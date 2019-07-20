import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener("turbolinks:before-cache", () => {
      const element = document.getElementsByClassName("notifications")[0];
      if (element) {
        element.style.display = "none";
        element.style.visibility = "hidden";
      }
    });
  }
}
