$(document).ready(function () {
  $(".tdfjq").mouseenter(function() {
    // Je récupère l'ID de la div dans laquelle je suis rentrée (this)
    var elementById = $(this).attr('id');
    // Je retire la class hidden de l'infobulle correspondante (ex : #pomme_infobuble)
    $("." + elementById + "_infobuble").removeClass("hidden");
  });
  // L'inverse et de la même manière
  $(".tdfjq").mouseleave(function() {
    var sameElementById = $(this).attr('id');
    $("." + sameElementById + "_infobuble").addClass("hidden");
  });
  // fonction pour supprimer et remettre le wrappi et pouvoir jouer avec toutes les trash 
  $(".button_for_hide_wrappi").click(function() {
    $(".wrappi").addClass("hidden");
    $(".button_for_hide_wrappi").addClass("hidden");
    $(".button_for_display_wrappi").removeClass("hidden");
  });
  $(".button_for_display_wrappi").click(function() {
    $(".wrappi").removeClass("hidden");
    $(".button_for_display_wrappi").addClass("hidden");
    $(".button_for_hide_wrappi").removeClass("hidden");
  });
});
