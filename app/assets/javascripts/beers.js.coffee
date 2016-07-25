# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Beer = ($resource) ->
    $resource(
      '/api/beers/:id/',
      {id: '@_id'},
      {update: {method: 'PUT'}}
    )

Beer
    .$inject = ['$resource']

BeersController = (Beer) ->
    init = () =>
        @beers = Beer.query()
        @edit = false

    init()
    return

BeersController
    .$inject = ['Beer']

angular.module('mainApp')
    .factory('Beer', Beer)
    .controller('BeersController', BeersController)
