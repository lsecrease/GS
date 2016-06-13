@Repos = React.createClass
  getInitialState: ->
    records: @props.data

  getDefaultProps: ->
    records: []

  addRecord: (record) ->
    records = React.addons.update(@state.records, { $push: [record] })
    @setState records: records

  deleteRecord: (record) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1]] })
    @replaceState records: records

  updateRecord: (record, data) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
    @replaceState records: records

  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Repos'
      React.DOM.div
        className: 'row'
        # React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Credit'
        # React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Debit'
        # React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Balance'
      #React.createElement RecordForm, handleNewRecord: @addRecord
      React.createElement SearchForm
      # React.DOM.hr null
      # React.DOM.table
      #   className: 'table table-bordered'
      #   React.DOM.thead null,
      #     React.DOM.tr null,
      #       React.DOM.th null, 'Date'
      #       React.DOM.th null, 'Title'
      #       React.DOM.th null, 'Amount'
      #       React.DOM.th null, 'Actions'
      #   React.DOM.tbody null,
      #     for record in @state.records
      #       React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord

      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-sm-6 col-md-4'
          React.createElement RepoCard
         


