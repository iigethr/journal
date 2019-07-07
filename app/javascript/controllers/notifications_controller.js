/*jshint esversion: 6 */

import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener("turbolinks:before-cache", () => {
      const element = document.getElementById("clear-notifications");
      if (element !== null) {
        element.style.display = "none";
        element.style.visibility = "hidden";
      }
    });
  }
}
