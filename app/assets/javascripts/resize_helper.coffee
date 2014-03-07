class Kebabindex.ResizeHelper
  constructor: ->
    Kebabindex.ResizeHelper.resize()
    $(window).resize Kebabindex.ResizeHelper.resize

  @resize: =>
    @resizeMap()

  @resizeMap: ->
    # Make sidebar and map as high as the browser window
    # Alter map width to be exaclty right to the Sidebar
    if $('.sidebar-left').is(':visible')
      $('#map').css 'width', ($(window).width() - $('.sidebar-left').width())
      $('#map, .sidebar-left').css 'height', $(window).height()
    else
      $('#map').css 'width', ($(window).width())
      $('#map, .sidebar-left').css 'height', $(window).height() - $('.top-bar').height()
