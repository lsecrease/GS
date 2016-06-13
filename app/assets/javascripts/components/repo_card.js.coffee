@RepoCard = React.createClass

    repo: ->
        React.DOM.div
            className: 'thumbnail'
            React.DOM.img
                src: ''
                React.DOM.div
                    className: 'caption'
                    React.DOM.h3
                        'Repo Title'
                        React.DOM.p
                            'Language'
                            React.DOM.p
                                '# of Stars'
                                
    render: ->
        @repo()