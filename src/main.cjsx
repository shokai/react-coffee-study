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
      <p>{@state.message}</p>
    </div>

React.render <App />
, document.getElementById 'app-container'
