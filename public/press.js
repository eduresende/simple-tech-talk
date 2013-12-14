$(document).ready(function(){

  var currentImage;

  function getCurrent() {
    $.ajax({
      url: "/current",
    }).done(function(data) {
      if (currentImage != data) {
        currentImage = data;
        $('.image').hide();
        $('#img-' + currentImage).fadeIn("slow");
        console.log(data);
      }
    });
  }

  setInterval(function () { getCurrent(); }, 2000);
});
