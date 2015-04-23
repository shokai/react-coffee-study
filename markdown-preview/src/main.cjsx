React    = require 'react'
mdparser = require 'markdown'

App = React.createClass
  getInitialState: ->
    markdown: ''

  updateMarkdown: (md) ->
    @setState
      markdown: md

  render: ->
    <div>
      <h1>markdown preview</h1>
      <TextInput onChange={@updateMarkdown} />
      <MarkdownPreview markdown={@state.markdown} />
    </div>

TextInput = React.createClass
  propTypes:
    onChange: React.PropTypes.func.isRequired

  onChange: (e) ->
    @props.onChange e.target.value

  render: ->
    <textarea onChange={@onChange}></textarea>

MarkdownPreview = React.createClass
  render: ->
    html = mdparser.parse @props.markdown
    <div dangerouslySetInnerHTML={ __html: html }></div>


React.render <App />
, document.getElementById 'app-container'
