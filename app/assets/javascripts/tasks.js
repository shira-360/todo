$(window).on("load", function() {
  $("li").on("click", function() {
    $("li.active").removeClass("active");
    $(this).addClass("active");
    $(".card-body div").hide(); 
    $("." + this.id).show();
  });
});