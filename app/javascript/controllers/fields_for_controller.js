import {Controller} from "stimulus"
export default class extends Controller {
  static targets = ["fields"]

  hide(e){
    e.target.closest("[data-target='fields-for.fields']").style = "display: none;"
  }
}
