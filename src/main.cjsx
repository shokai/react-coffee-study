React = require 'react'

App = React.createClass
  getInitialState: ->
    message: ''

  updateMessage: (e) ->
    @setState
      message: e.target.value

  render: ->
    <div>
      <input type="text" onChange={@updateMessage} />
      <Message message={@state.message} />
    </div>


Message = React.createClass
  render: ->
    <p>{@props.message}</p>

React.render <App />
, document.getElementById 'app-container'
