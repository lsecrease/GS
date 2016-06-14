@RepoCard = React.createClass

    repo: ->
        React.DOM.div
            className: 'thumbnail'
            #React.DOM.img
                #src: '{@props.data.picture}'
            React.DOM.div
                className: 'caption'
                React.DOM.h3
                    '{@props.data.title}'
                    React.DOM.p
                        '@props.data.language'
                        React.DOM.p
                            '{@props.data.stars} of Stars'
                                
    render: ->
        @repo()