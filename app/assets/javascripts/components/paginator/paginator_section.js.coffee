
@PaginatorSection = React.createClass
  displayName: 'PaginatorSection'

  handleOnClick: (pageNumber) ->
    @props.onPaginate(pageNumber)

  render: ->
    if @props.totalPages > 1
        React.DOM.ul
            className: 'pagination'
            for i in [1..@props.totalPages]
              React.DOM.li
                key: {i}
                if i == @props.currentPage
                    React.DOM.span '&nbsp'
                else
                    React.createElement PaginatorLink, pageNumber: {i}, onPaginatorLinkClick: @handleOnClick
              
            
        
      
    else
        React.DOM.div '&nbsp'
      