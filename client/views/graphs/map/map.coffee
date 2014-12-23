Template.map.rendered = ->
  createMap = ->
    height = 600
    width = 100
    projection = d3.geo.albersUsa().scale(1000).translate([
      width / 2
      height / 2
    ])
    path = d3.geo.path().projection(projection)
    svg = d3.select("#map").append("svg").attr("viewBox", "0 50 1000 550").attr("preserveAspectRatio", "xMinYMin meet")
