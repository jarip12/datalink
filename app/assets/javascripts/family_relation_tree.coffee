$(document).on 'ready page:load', ->
  if $('#family_tree_graph').length == 0
    return
  console.log "family_relation_coffee load"
  margin =
    top: -150
    right: 10
    bottom: 100
    left: 10

  width = 840
  height = 600

  flatten = (root) ->
    n = []
    i = 0

    recurse = (node) ->
      if node.children
        node.children.forEach recurse
      if !node.id
        node.id = ++i
      n.push node
      return

    recurse root
    n

  kx = (d) ->
    d.x - 20

  ky = (d) ->
    d.y - 10

  #this place the text x axis adjust this to center align the text

  image_x = (d) ->
    d.x

  image_y = (d) ->
    d.y + 10

  tx = (d) ->
    d.x - (d.name.length * 2)

  #thie place the text y axis adjust this to center align the text

  ty = (d) ->
    d.y + 100

  #thie place the text x axis adjust this to center align the text

  jx = (d) ->
    d.x + 10

  #thie place the text y axis adjust this to center align the text

  jy = (d) ->
    d.y - 20

  #make an SVG
  $('#family_tree_graph').empty()
  svg = d3.select('#family_tree_graph').append('svg').attr('width', width + margin.left + margin.right).attr('height', height + margin.top + margin.bottom).append('g').attr('transform', 'translate(' + margin.left + ',' + margin.top + ')')
  #My JSON note the
  #no_parent: true this ensures that the node will not be linked to its parent
  #hidden: true ensures that the nodes is not visible.

  console.log(gon.node_data)
  allNodes = flatten(gon.node_data)
  #This maps the siblings together mapping uses the ID using the blue line
  siblings = gon.link_data
  # Compute the layout.
  tree = d3.layout.tree().size([
    width
    height
  ])
  nodes = tree.nodes(gon.node_data)
  links = tree.links(nodes)


  sblingLine = (d, i) ->
    #start point
    start = allNodes.filter((v) ->
      if d.source.id == v.id
        true
      else
        false
    )
    #end point
    end = allNodes.filter((v) ->
      if d.target.id == v.id
        true
      else
        false
    )
    #define teh start coordinate and end co-ordinate
    linedata = [
      {
        x: start[0].x
        y: start[0].y
      }
      {
        x: end[0].x
        y: end[0].y
      }
    ]
    fun = d3.svg.line().x((d) ->
      d.x
    ).y((d) ->
      d.y
    ).interpolate('linear')
    fun linedata


  ###*
  This draws the lines between nodes.
  *
  ###

  elbow = (d, i) ->
    `var nodes`
    if d.target.no_parent
      return 'M0,0L0,0'
    diff = d.source.y - (d.target.y)
    #0.40 defines the point from where you need the line to break out change is as per your choice.
    ny = d.target.y + diff * 0.40
    linedata = [
      {
        x: d.target.x
        y: d.target.y
      }
      {
        x: d.target.x
        y: ny
      }
      {
        x: d.source.x
        y: d.source.y
      }
    ]
    fun = d3.svg.line().x((d) ->
      d.x
    ).y((d) ->
      d.y
    ).interpolate('step-after')
    fun linedata

  svg.selectAll('.link').data(links).enter().append('path').attr('class', 'link').attr 'd', elbow
  nodes = svg.selectAll('.node').data(nodes).enter()
  #First draw sibling line with blue line
  svg.selectAll('.sibling').data(siblings).enter().append('path').attr('class', 'sibling').attr 'd', sblingLine
  # Create the node rectangles.
  nodes.append('rect').attr('class', 'node').attr('height', 90).attr('width', 90).attr('id', (d) ->
    d.id
  ).attr('display', (d) ->
    if d.hidden
      'none'
    else
      ''
  ).attr('x', kx).attr 'y', ky
  # Create the node text label.
  nodes.append('text').text((d) ->
    d.name
  ).attr('x', tx).attr 'y', ty
  nodes.append('text').text((d) ->
    d.job
  ).attr('x', jx).attr 'y', jy

  nodes.append("svg:image")
  .attr('x', image_x)
  .attr('y', image_y)
  .attr('width', 50)
  .attr('height', 54)
  .attr("xlink:href", (d) ->
    d.avatar_link)
