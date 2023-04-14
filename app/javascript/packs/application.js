import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// import jQuery from "jquery"
import "jquery"
import "popper.js"
import "bootstrap"

import '@fortawesome/fontawesome-free/js/all';
import "../stylesheets/application"

// import Raty from "raty.js"
// window.raty = function(elem,opt) {
//   let raty =  new Raty(elem,opt)
//   raty.init();
//   return raty;
// }

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Javascriptのライブラリ読み込み
// import Chart from "chart.js/auto";
// global.Chart = Chart;

// 応用課題７Dのために追加
window.$ = window.jQuery = require('jquery');
// require('packs/raty')
// global.$ = jQuery;
// window.$ = jQuery;