import {Controller} from "stimulus";
import zahaAlignments from "@iigethr/zaha_alignments";

export default class extends Controller {
  connect() {
    zahaAlignments.centerH();
  }
}
