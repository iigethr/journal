// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction

import { Controller } from "stimulus"
import $ from "jquery"
import jQuery from "jquery"
import altaiAutosize from "altai_autosize"
import altaiCenter from "altai_center"
import altaiOff from "altai_off"
import altaiSortable from "altai_sortable"
import popup from "jquery-popup-overlay"

export default class extends Controller {
  initialize() {
    $(".altai-autosize").altaiAutosize()
    $(".altai-center").altaiCenter()
    $(".altai-off").altaiOff()
    $(".sortable").altaiSortable()
    $( ".toggle-btn" ).click(function() {
      $( ".toggle" ).slideToggle( "slow" )
    })
    $('#JPO').popup()
    Turbolinks.clearCache()
  }
}
