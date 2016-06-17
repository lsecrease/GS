
@PaginatorLink = React.createClass
  
  displayName: 'PaginatorLink'

  handleOnClick: (e) ->
    e.preventDefault()
    @props.onPaginatorLinkClick(@props.pageNumber)

  render: ->
      React.DOM.a
        href: '#'
        onClick: @handleOnClick
        '&nbsp'
  