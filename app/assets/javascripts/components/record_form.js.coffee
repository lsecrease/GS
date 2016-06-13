@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''

  valid: ->
    @state.title && @state.date && @state.amount

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
        React.DOM.div
          className: 'input-group'
          React.DOM.input
            className: 'form-control'
            type: 'text'
            placeholder: "Search for..."
            React.DOM.span
              className: 'input-group-btn'
              React.DOM.button
                className: 'btn btn-default'
                type: 'button'
                'Search'

    
    
    # React.DOM.form
    #   className: 'form-inline'
    #   onSubmit: @handleSubmit
    #   React.DOM.div
    #     className: 'form-group'
    #     React.DOM.input
    #       type: 'text'
    #       className: 'form-control'
    #       placeholder: 'Date'
    #       name: 'date'
    #       value: @state.date
    #       onChange: @handleChange
    #   React.DOM.div
    #     className: 'form-group'
    #     React.DOM.input
    #       type: 'text'
    #       className: 'form-control'
    #       placeholder: 'Title'
    #       name: 'title'
    #       value: @state.title
    #       onChange: @handleChange
    #   React.DOM.div
    #     className: 'form-group'
    #     React.DOM.input
    #       type: 'number'
    #       className: 'form-control'
    #       placeholder: 'Amount'
    #       name: 'amount'
    #       value: @state.amount
    #       onChange: @handleChange
    #   React.DOM.button
    #     type: 'submit'
    #     className: 'btn btn-primary'
    #     disabled: !@valid()
    #     'Create record'
