React = require 'react'

App = React.createClass
  getInitialState: ->
    message: ''

  updateMessage: (message) ->
    @setState
      message: message

  render: ->
    <div>
      <MessageInput onChange={@updateMessage} />
      <Message message={@state.message} />
    </div>

MessageInput = React.createClass
  onChange: (e) ->
    @props.onChange e.target.value

  render: ->
    <input type="text" onChange={@onChange} />

Message = React.createClass
  render: ->
    <p>{@props.message}</p>

React.render <App />
, document.getElementById 'app-container'
