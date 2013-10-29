//= require jquery

jQuery.expr[":"].external = function(obj){
  return /^http:\/\//.exec(jQuery(obj).attr('href'));
};

jQuery(function($){
  $('a:external').attr('target', '_blank').addClass('external');
});
