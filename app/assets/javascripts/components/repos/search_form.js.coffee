@SearchForm = React.createClass
  getInitialState: ->
    search: ''
   

  valid: ->
    @state.search 

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.div
      className: 'jumbotron'
      React.DOM.div
        className: 'col-md-6'
        React.DOM.form
          className: 'form-inline'
          onSubmit: @handleSubmit
          React.DOM.div
            className: 'form-group'
            React.DOM.div
              className: 'input-group'
              React.DOM.input
                className: 'form-control'
                type: 'text'
                placeholder: "Search for..."
                name: 'search'
                value: @state.search
                onChange: @handleChange
                React.DOM.span
                  className: 'input-group-btn'
                  React.DOM.button
                    className: 'btn btn-default'
                    type: 'submit'
                    disabled: !@valid()
                    'Search'

    
   
  