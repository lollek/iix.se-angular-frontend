Game = ['$resource', ($resource) ->
    $resource(
        '/api/games/:id',
        {id: '@_id'},
        {update: {method: 'PUT'}}
    )
]

angular.module('mainApp')
    .factory('Game', Game)
