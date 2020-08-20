import {Controller} from 'stimulus'

export default class extends Controller {
  static targets = ['fields', 'destroy', 'template', 'games']

  hide(e) {
    let fields = e.target.closest('[data-target="fields-for.fields"]');
    e.preventDefault();

    fields.children[0].value = '1';
    fields.style = 'display: none;';
  }

  add(e) {
    let clone = this.templateTarget.cloneNode(true);
    clone.innerHTML = clone.innerHTML.replace(/new_field/g, new Date().getTime());
    let fragment = document.importNode(clone.content, true)

    e.preventDefault();

    this.gamesTarget.appendChild(fragment);
    $('[data-behavior="selectpicker"]').selectpicker();
  }
}
