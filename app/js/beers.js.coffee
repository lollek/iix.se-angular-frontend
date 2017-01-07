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
        @reset_beer = reset_beer
        @save_beer = save_beer
        @delete_beer = delete_beer
        @add_row = add_row

        @beers = Beer.query()
        return

    reset_beer = (index, id) =>
        @beers[index] = Beer.get({id:id})
        return

    save_beer = (index, id) =>
        if id
            @beers[index] = Beer.update({id: id}, @beers[index])
        else
            @beers[index] = Beer.save(@beers[index])
        return

    delete_beer = (index, id) =>
        if id
            Beer.delete({id: id},
              () => @beers.splice(index, 1),
              @show_error)
        else
            @beers.splice(index, 1)
        return

    add_row = () =>
        @beers.push(new Beer())
        return

    init()
    return

BeersController
    .$inject = ['Beer']

angular.module('mainApp')
    .factory('Beer', Beer)
    .controller('BeersController', BeersController)
