$(document).on('turbolinks:load', function () {
  ityped.init(document.querySelector("#ityped"), {
    strings: ['Post complete'],
    typeSpeed: 100,
    backSpeed: 80,
    startDelay: 500,
    loop: true
  });
})