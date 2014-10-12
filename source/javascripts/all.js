//= require_tree .

var phrases = ['I like my egg with a beard', '"Rest in pepperoni pizza"', '"OoooOOOhhh killem"', '"Pepper \'im... peppperrr \'iiim"'];

document.body.onload = function () {
  var this_phrase = phrases[Math.round(Math.random() * (phrases.length - 1))];

  document.getElementById('intro-text').innerHTML = this_phrase;
};