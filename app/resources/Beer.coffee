Beer = ($resource) ->
    $resource(
        '/api/beers/:id/',
        {id: '@_id'},
        {update: {method: 'PUT'}}
    )

Beer.$inject = ['$resource']

angular.module('mainApp')
    .factory('Beer', Beer)
