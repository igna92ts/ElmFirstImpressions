
require('materialize-css/dist/css/materialize.min.css');
require('materialize-css/dist/js/materialize.min.js');
require('./index.html');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

// .embed() can take an optional second argument. This would be an object describing the data we need to start a program, i.e. a userID or some token
var app = Elm.Main.embed(mountNode);