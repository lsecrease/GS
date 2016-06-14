@Repos = React.createClass
  getInitialState: ->
    repos: []
    meta:
      total_pages: 0
      current_page: 1
      total_count: 0
      fetchData: ''
      search: ''
      page: 1

  getDefaultProps: ->
    repos: []

  render: ->
    # cardsNode = @state.repos.map(repo) ->
    #   React.createElement RepoCard, key: repo.id
      
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Repos'
      React.DOM.div
        className: 'row'
      #React.createElement RecordForm, handleNewRecord: @addRecord
      React.createElement SearchForm
     
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-sm-6 col-md-4'
          #for repo in @state.repos
          React.createElement RepoCard
         


