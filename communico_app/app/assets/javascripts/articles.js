console.log("articles.js linked!");
var link_text;

$(document).ready(function() {
  $("#article_link").on("input", function() {
    link_text = $(this).val();
    console.log(link_text);
  });
});
