@Repos = React.createClass
  getInitialState: ->
    didFetchData: false
    repos: []
    meta:
      total_pages: 0
      current_page: 1
      total_count: 0
    fetchData:
      search: ''
      page: 1

  getDefaultProps: ->
    repos: []
    
  componentDidMount: ->
    @fetchRepos({})
    
  fetchRepos: () ->
    $.ajax
      url: Routes.repos_path()
      dataType: 'json'
      data: @state.fetchData
    .done @fetchDataDone
    .fail @fetchDataFail
    
  fetchDataDone: (data, textStatus, jqXHR) ->
      return false unless @isMounted()
      @setState
        didFetchData: true
        repos: data.repos
        meta: data.meta

  fetchDataFail: (xhr, status, err) =>
      console.log 'testing'
      #console.error @props.url, status, err.toString()
      
   
  handleOnSearchSubmit: (search) ->
    @state.fetchData=
      search: search
      page: 1

    @fetchRepos()
    
  handleOnPaginate: (pageNumber) ->
      @state.fetchData.page = pageNumber
      @fetchRepos()

  render: ->
    cardsNode = @state.repos.map (repo) ->
      React.createElement RepoCard, key: repo.id, data: repo
      
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Repos'
      React.DOM.div
        className: 'row'
      #React.createElement RecordForm, handleNewRecord: @addRecord
        React.createElement SearchForm, total_count: @state.meta.total_pages, onSubmit: @handleOnSearchSubmit
     
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-sm-6 col-md-8',
            cardsNode
            # for repo in @state.repos
            #   React.createElement RepoCard, key: repo.id
        
        React.createElement PaginatorSection, totalPages: @state.meta.total_pages, currentPage: @state.meta.current_page, onPaginate: @handleOnPaginate
        
        
