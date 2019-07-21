import {Controller} from "stimulus";
import zahaVisibilities from "@iigethr/zaha_visibilities";

export default class extends Controller {
  connect() {
    document.addEventListener("turbolinks:before-cache", () => {
      const element = document.getElementsByClassName("notifications")[0];
      if (element) {
        element.style.display = "none";
        element.style.visibility = "hidden";
      }
    });
    zahaVisibilities.hideOnClick("hide-trigger", "notifications");
  }
}
