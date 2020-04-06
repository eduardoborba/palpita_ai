import {Controller} from "stimulus"
export default class extends Controller {
  static targets = ["fields"]

  hide(e) {
    e.preventDefault();
    e.target.closest("[data-target='fields-for.fields']").style = "display: none;"
  }

  add(e) {
    e.preventDefault();
    e.target.insertAdjacentHTML('beforebegin', e.target.dataset.fields.replace(/new_field/g, new Date().getTime()));
  }
}
