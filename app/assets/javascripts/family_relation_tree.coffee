$(document).on 'ready page:load', ->
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

  tx = (d) ->
    if d.name == 'JamesPotter'
      return d.x - 23
    if d.name == 'LilyPotter'
      return d.x - 8
    if d.name == 'HenryPotter'
      return d.x - 18
    if d.name == 'HarryPotter'
      return d.x - 16
    if d.name == 'GinnyPotter'
      return d.x - 18
    if d.name == 'SiriusPotter'
      return d.x - 18
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
  svg = d3.select('#graph').append('svg').attr('width', width + margin.left + margin.right).attr('height', height + margin.top + margin.bottom).append('g').attr('transform', 'translate(' + margin.left + ',' + margin.top + ')')
  #My JSON note the
  #no_parent: true this ensures that the node will not be linked to its parent
  #hidden: true ensures that the nodes is not visible.
  root =
    name: ''
    id: 1
    hidden: true
    children: [
      {
        job: '父亲'
        name: 'JamesPotter'
        id: 16
        no_parent: true
      }
      {
        name: ''
        id: 2
        no_parent: true
        hidden: true
        children: [
          {
            name: 'HarryPotter'
            id: 3
          }
          {
            name: ''
            id: 4
            hidden: true
            no_parent: true
            children: [
              {
                job:"子",
                name: "JamesPotter",
                id: 5,
              }, {
                job:"子",
                name: "SiriusPotter",
                id: 6,
              },{
                job:"女",
                name:"LilyPotter",
                id:7
              }
            ]
          }
          {
            job: '配偶'
            no_parent: true
            name: 'GinnyPotter'
            id: 11
          }
        ]
      }
      {
        job: '母亲'
        name: 'LilyPotter'
        id: 10
        no_parent: true
        children: []
      }
    ]

  console.log(gon.tree_data)
  allNodes = flatten(gon.tree_data)
  #This maps the siblings together mapping uses the ID using the blue line
  siblings = [
    {
      source:
        id: 3
        name: 'HarryPotter'
      target:
        id: 11
        name: 'GinnyPotter'
    }
    {
      source:
        id: 16
        name: 'JamesPotter'
      target:
        id: 10
        name: 'LilyPotter'
    }
  ]
  # Compute the layout.
  tree = d3.layout.tree().size([
    width
    height
  ])
  nodes = tree.nodes(root)
  links = tree.links(nodes)
  # Create the link lines.

  ###*
  This defines teh line between siblings.
  *
  ###

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

  ###To make the nodes in flat mode.
  This gets all teh nodes in same level
  ###



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
