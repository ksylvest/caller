class Application extends Backbone.View
  el: "#main"

  events:
    "click .button" : "button"
    "click .action.dial" : "dial"
    "click .action.hang" : "hang"
    "keyup" : ""

  initialize: (options = {}) ->
    $(document).on('keyup', @keyup)
    @phono = $.phono apiKey: '9d690e266ec3db26934eaff4d261cd76'
    @render()
    super

  remove: ->
    $(document).off('keyup', @keyup)
    delete @phono
    super

  render: ->
    @$number = @$('.number')
    super

  keyup: (event) =>
    return if event.target.form?
    @flush() if event.which is 27 # esc
    @append 0 if event.which is 48 # 0
    @append 1 if event.which is 49 # 1
    @append 2 if event.which is 50 # 2 
    @append 3 if event.which is 51 # 3
    @append 4 if event.which is 52 # 4
    @append 5 if event.which is 53 # 5
    @append 6 if event.which is 54 # 6
    @append 7 if event.which is 55 # 7
    @append 8 if event.which is 56 # 8
    @append 9 if event.which is 57 # 9

  flush: ->
    @$number.val("")

  append: (key) ->
    @$number.val("#{@$number.val()}#{key}")

  number: ->
    @$number.val()

  button: (event) ->
    event.preventDefault()
    event.stopPropagation()
    @append $(event.currentTarget).data('key')

  hang: (event) ->
    event.preventDefault()
    event.stopPropagation()
    return unless @call
    @call.hangup()
    delete @call

  dial: (event) ->
    event.preventDefault()
    event.stopPropagation()
    return if @call
    @call = @phono.phone.dial(@number())

  ring: =>

  answer: =>

  hangup: =>

$ -> new Application
