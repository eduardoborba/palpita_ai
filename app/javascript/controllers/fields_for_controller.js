import {Controller} from "stimulus"

export default class extends Controller {
  static targets = ["fields", "destroy"]

  hide(e) {
    let fields = e.target.closest("[data-target='fields-for.fields']");
    e.preventDefault();

    fields.children[0].value = '1';
    fields.style = 'display: none;';
  }

  add(e) {
    let html = e.target.dataset.fields.replace(/new_field/g, new Date().getTime());

    e.preventDefault();
    e.target.insertAdjacentHTML('beforebegin', html);
    $('[data-behavior="selectpicker"]').selectpicker();
  }
}
