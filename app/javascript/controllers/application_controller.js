// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction

import { Controller } from "stimulus"
import $ from "jquery"
import jQuery from "jquery"
import altaiCenter from "altai_center"
import altaiOff from "altai_off"

export default class extends Controller {
  initialize() {
    $(".altai-center").altaiCenter()
    $(".altai-off").altaiOff()
    Turbolinks.clearCache()
  }
}
