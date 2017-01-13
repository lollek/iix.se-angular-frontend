MarkdownText = ($resource) ->
    $resource(
        '/api/markdown/:id',
        {id: '@_id'},
        {update: {method: 'PUT'}}
    )

MarkdownText.$inject = ['$resource']

angular.module('mainApp')
    .factory('MarkdownText', MarkdownText)
