Beer = ['$resource', ($resource) ->
    $resource(
        '/api/beers/:id/',
        {id: '@_id'},
        {update: {method: 'PUT'}}
    )
]

angular.module('mainApp')
    .factory('Beer', Beer)
