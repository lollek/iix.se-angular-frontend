Book = ['$resource', ($resource) ->
    $resource(
        '/api/books/:id',
        {id: '@_id'},
        {update: {method: 'PUT'}}
    )
]

angular.module('mainApp')
    .factory('Book', Book)
