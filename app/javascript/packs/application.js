// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "controllers";

// Internal imports
import { displayProducts } from '../plugins/select_products';
import { changeStatus } from '../plugins/change_status';
import { initMapbox } from '../plugins/init_mapbox';
import { initSortable } from '../plugins/init_sortable';
import { attributeRider } from '../plugins/rider_attribution';

document.addEventListener('turbolinks:load', () => {
  
  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
  });

  if (document.getElementById('new-order-container')) {
    $('#search-customer').modal();
    displayProducts();
  }

  if (document.getElementById('order-show-container')) {
    changeStatus()
  }

  initMapbox();

  if (document.getElementById("address-list-container")) {
    initSortable();
    attributeRider();
  }

});
