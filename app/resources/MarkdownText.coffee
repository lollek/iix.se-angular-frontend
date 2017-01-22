MarkdownText = ['$resource', ($resource) ->
    $resource(
        '/api/markdown/:id',
        {id: '@_id'},
        {update: {method: 'PUT'}}
    )
]

angular.module('mainApp')
    .factory('MarkdownText', MarkdownText)
