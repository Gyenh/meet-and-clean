$(document).ready(function() {
  $(".arrow_right").click(function () {
    var currentBlock = $(".mini_wrappi:visible").attr("id");
    var nextBlock = $(".mini_wrappi:visible").next().attr("id");
    if (nextBlock == null) {
      var firstBlock = $(".mini_wrappi:visible").prevAll(".mini_wrappi").last().attr("id");
      $("#" + firstBlock).removeClass("hidden");
    } else {
      $("#" + nextBlock).removeClass("hidden");
    }
    $("#" + currentBlock).addClass("hidden");
  });
  $(".arrow_left").click(function () {
    var currentBlock = $(".mini_wrappi:visible").attr("id");
    var previousBlock = $(".mini_wrappi:visible").prev().attr("id");
    if (previousBlock == null) {
      var lastBlock = $(".mini_wrappi:visible").nextAll(".mini_wrappi").last().attr("id");
      $("#" + lastBlock).removeClass("hidden");
    } else {
       $("#" + previousBlock).removeClass("hidden");
    }
    $("#" + currentBlock).addClass("hidden");
  });
});
