Book = ($resource) ->
    $resource(
        '/api/books/:id',
        {id: '@_id'},
        {update: {method: 'PUT'}}
    )

Book.$inject = ['$resource']

angular.module('mainApp')
    .factory('Book', Book)
