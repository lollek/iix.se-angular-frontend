Note = ['$resource', ($resource) ->
    $resource(
        '/api/notes/:id',
        { id: '@_id' },
        { update: { method: 'PUT' } }
    )
]

angular.module('mainApp')
    .factory('Note', Note)
