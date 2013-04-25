#
#-----------------------------------------------------------------------------
#  A limechat theme by Tad Thorley
#  The solarized color scheme is by Ethan Schoonover
#-----------------------------------------------------------------------------
#
String.prototype.startsWith = (str) -> @indexOf(str) == 0
String.prototype.includes   = (str) -> @indexOf(str) >= 0

class SolarizedDark
  constructor: ->
    @initializeVars()
    @createTopicNode()
    @addListeners()
  
  initializeVars: ->
    @hideEvents = false
    @doc   = document
    @body  = document.body
    @topic = null
      
  createTopicNode: ->
    @topic = @getNode('topic')
    if @topic == null
      if @bodyAttribute('type') == 'channel' || @bodyAttribute('type') == 'talk'
        @topic = @doc.createElement('div')
        @topic.id = 'topic'
        @body.appendChild(@topic)
        @topic.onclick = => @toggleEvents()
      if @bodyAttribute('type') == "talk"
        @setTopic('Private Channel')
    
  addListeners: ->
    processNode = (ev) =>
      node = ev.target
      if @bodyAttribute('type') == 'channel'
        @checkTimestamp(node)
        @checkTopic(node)
        @checkEvent(node)
    @doc.addEventListener("DOMNodeInserted", processNode, false)
  
  checkTimestamp: (node) ->
    prev_time_node = node.previousSibling.firstChild
    curr_time_node = node.firstChild
    if prev_time_node.className.includes('time') && curr_time_node.className.includes('time')
      if prev_time_node.innerHTML == curr_time_node.innerHTML
        curr_time_node.className += ' duptime'
  
  checkTopic: (node) ->
    message_node = node.lastChild
    if node.className.includes('event')
      if message_node.innerText.startsWith('Topic')
        message_node.setAttribute('type', 'topic')
      if message_node.getAttribute('type') == 'topic'
        @setTopic(message_node.innerText.match(/opic: (.*)$/)[1])
        
  checkEvent: (node) ->
    if node.className.includes('event') && @hideEvents
      node.style.display = 'none'
    
  toggleEvents: ->
    @hideEvents = !@hideEvents
    if @hideEvents
      (node.style.display = 'none' if node.className.includes('event')) for node in @body.childNodes
    else
      node.style.display = 'block' for node in @body.childNodes
        
  setTopic: (topic) -> @topic.innerText = topic
    
  bodyAttribute: (attr) -> @body.getAttribute(attr)
  
  getNode: (id) -> @doc.getElementById(id)
  

solarized_dark = new SolarizedDark