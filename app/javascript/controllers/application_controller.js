import {Controller} from "stimulus";
import zahaAlignments from "@iigethr/zaha_alignments";
import zahaSortable from "@iigethr/zaha_sortable";

export default class extends Controller {
  connect() {
    zahaAlignments.centerH();
    zahaSortable.position();
  }
}
