# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MarkdownText = ($resource) ->
    $resource(
        '/api/markdown/:id',
        {id: '@_id'},
        {update: {method: 'PUT'}})

MarkdownText.$inject = ['$resource']

MarkdownController = ($location, MarkdownText) ->
    init = () =>
        @edit = edit
        @save = save
        @discard = discard

        @location = $location.path()
        @id = switch
            when @location == '/sofie' then 'sofie'
            else $location.path('/404')
        @content = MarkdownText.get({id: @id})
        @editing = false

    edit = () =>
        @editing = true
        return

    save = () =>
        @editing = false
        @content = MarkdownText.update({id: @id}, @content)
        return

    discard = () =>
        @editing = false
        @content = MarkdownText.get({id: @id})
        return

    init()
    return

MarkdownController
    .$inject = ['$location', 'MarkdownText']

angular.module('mainApp')
    .factory('MarkdownText', MarkdownText)
    .controller('MarkdownController', MarkdownController)
