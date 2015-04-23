React = require 'react'

App = React.createClass
  getInitialState: ->
    message: ''
    savedMessages: []

  updateMessage: (msg) ->
    @setState
      message: msg

  saveMessage: (msg) ->
    msgs = @state.savedMessages.concat msg
    @setState
      savedMessages: msgs

  render: ->
    <div>
      <MessageInput
       onChange={@updateMessage}
       onSave={@saveMessage} />
      <Message
       message={@state.message}
       savedMessages={@state.savedMessages} />
    </div>

MessageInput = React.createClass
  onChange: (e) ->
    @props.onChange e.target.value

  onKeyDown: (e) ->
    if e.keyCode is 13
      @props.onSave e.target.value
      e.target.value = ''

  render: ->
    <input type="text"
     onChange={@onChange}
     onKeyDown={@onKeyDown} />

Message = React.createClass
  render: ->
    msgs = @props.savedMessages.map (msg) -> <li>{msg}</li>
    <div>
      <p>{@props.message}</p>
      <ul>{msgs}</ul>
    </div>

React.render <App />
, document.getElementById 'app-container'
