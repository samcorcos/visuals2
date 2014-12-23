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

    ################
    # Building Map #
    ################
    d3.json "us.json", (err, us) ->
      return console.error(err) if err
      svg.append("path").datum(topojson.feature(us, us.objects.subunits)).attr "d", path

      svg.selectAll(".subunit").data(topojson.feature(us, us.objects.subunits).features).enter().append("path").attr("class", (d) ->
        "subunit " + d.id
      ).attr("d", path).style "fill", "#aaa"

      ############################
      # Drawing State Boundaries #
      ############################
      svg.insert("path", "graticule").datum(topojson.feature(us, us.objects.subunits, (a, b) ->
        a isnt b
      )).attr("class", "state-boundary").attr("d", path).attr("stroke", "#fff").style "fill", "none"

      ############################
      # Populating Concentration #
      ############################
      locationConcentration = {}
      paths = d3.selectAll("path")[0]
      paths.forEach (path) ->

        # Getting state abbreviations out of the DOM #
        classString = path.className.animVal
        state = classString.slice(classString.length - 2)
        locatoinConcentration[state] = 0
        return

      ###################################
      # Getting Locations From Database #
      ###################################
      # getLocations = ->
      #   locations = []
      #   temp =




  createMap()
