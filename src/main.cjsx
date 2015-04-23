React = require 'react'

Hello = React.createClass
  render: ->
    <div>
      <h1>Hello, React</h1>
    </div>

React.render <Hello />
, document.getElementById 'app-container'
