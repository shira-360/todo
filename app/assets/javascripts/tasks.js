$(window).on("load", function() {
  console.log("window")
  $("li").on("click", function() {
    console.log("aaa")
    $("li.active").removeClass("active");
    $(this).addClass("active");
    $(".card-body div").hide(); 
    $("." + this.id).show();
  });
});