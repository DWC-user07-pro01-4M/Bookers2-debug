import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jQuery from "jquery"
import "popper.js"
import "bootstrap"

import '@fortawesome/fontawesome-free/js/all';
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

global.$ = jQuery;
window.$ = jQuery;

// Javascriptのライブラリ読み込み
// import Chart from "chart.js/auto";
// global.Chart = Chart;

// 応用課題７Dのために追加
// window.$ = window.jQuery = require('jquery');
// require('packs/raty')