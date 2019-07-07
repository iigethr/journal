/*jshint esversion: 6 */

import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    const elements = document.querySelectorAll("div.center-h");
    if (elements !== null) {
      elements.forEach( (element) => {
        console.log(element);
        // centerHParent
        const centerHParent = document.createElement("div");
        centerHParent.setAttribute("class", "center-h-parent");
        // centerHChild
        const centerHChild = document.createElement("div");
        centerHChild.setAttribute("class", "center-h-child");
        // Insert centerHParent
        element.parentNode.insertBefore(centerHParent, element);
        // Append
        centerHParent.appendChild(centerHChild);
        centerHChild.appendChild(element);
      });
    }
  }
}
