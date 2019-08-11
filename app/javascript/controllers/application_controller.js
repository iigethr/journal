import {Controller} from "stimulus";
import zahaAlignments from "@iigethr/zaha_alignments";
import {Sortable} from "@shopify/draggable";
import Rails from "@rails/ujs";

export default class extends Controller {
  connect() {
    zahaAlignments.centerH();

    const sortableBox = document.querySelectorAll(".sortable");

    if (sortableBox.length >= 1) {
      const sortable = new Sortable(sortableBox, {
        draggable: ".sortable-item",
      });

      const path = sortableBox[0].getAttribute("data-url");

      sortable.on("sortable:start", (event) => {
        // console.log(event);
      });

      sortable.on("sortable:sort", (event) => {
        // console.log(event);
      });

      sortable.on("sortable:sorted", (event) => {
        // console.log(event);
      });

      sortable.on("sortable:stop", (event) => {
        const selectors = ".sortable-item:not(.draggable--original):not(.draggable-mirror)";
        const inputs = document.querySelectorAll(selectors);

        const reg = /(.+)[-=_](.+)/g;
        const value = "$1[]=$2";

        const convertedArray = [];

        for (let i = 0, length = inputs.length; i < length; i++) {
          if (inputs[i].id) {
            convertedArray.push(inputs[i].id.replace(reg, value));
          }
        }

        const argsString = convertedArray.join("&");
        const records = argsString;

        Rails.ajax({
          url: path,
          type: "PATCH",
          data: records,
        });
      });
    }
  }
}
