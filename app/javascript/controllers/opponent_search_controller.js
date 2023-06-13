import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"


export default class extends Controller {
  connect() {
    new TomSelect(this.element, {
      valueField: 'id',
      labelField: 'name',
      searchField: 'name',
      maxItems: 1,
      // fetch remote data
      load: function(query, callback) {

        var url = `/users?s=${query}`;
        fetch(url)
          .then(response => response.json())
          .then(json => {
            callback(json.items);
          }).catch(()=>{
            callback();
          });

      },
      // custom rendering functions for options and items
      render: {
        option: function(user, escape) {
          return `<div class="py-2 d-flex">${user.name}</div>`;
        },
        item: function(user, escape) {
          return `<div class="py-2 d-flex">${user.name}</div>`;
        }
      },
    });

  }
}
