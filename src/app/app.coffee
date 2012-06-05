$ ->
  $(document.links).filter () ->
    @hostname != window.location.hostname
  .attr 'target', '_blank'
