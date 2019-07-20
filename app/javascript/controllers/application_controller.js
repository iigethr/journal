import {Controller} from "stimulus";
import altaiAlignments from "altai_alignments";

export default class extends Controller {
  connect() {
    altaiAlignments();
  }
}
