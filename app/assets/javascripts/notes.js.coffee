# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Note = ($resource) ->
    $resource(
        '/api/notes/:id',
        {id: '@_id'},
        {update: {method: 'PUT'}})

Note.$inject = ['$resource']

NotesController = ($routeParams, $location, Note) ->
    init = () =>
        @edit = edit
        @save = save
        @discard = discard
        @remove = remove

        @editing = false

        if $routeParams.noteId == '0'
            @note = new Note()
            @note.date = new Date(Date.now()).toISOString().slice(0,10)
            @editing = true
        else if $routeParams.noteId != undefined
            @note = Note.get({id: $routeParams.noteId})
        else
            @notes = Note.query()
        return

    edit = () =>
        @editing = true
        return

    save = () =>
        @editing = false
        if @note.id is undefined
            @note = Note.save(@note, (res) -> $location.path('/notes/' + res.id))
        else
            @note = Note.update({id: $routeParams.noteId}, @note)
        return

    discard = (index, id) =>
        @editing = false
        @note = Note.get({id: $routeParams.noteId})
        return

    remove = (index, id) =>
        @notes.splice(index, 1)
        Note.delete({id: id}) if id
        return


    init()
    return

NotesController
    .$inject = ['$routeParams', '$location', 'Note']

angular.module('mainApp')
    .factory('Note', Note)
    .controller('NotesController', NotesController)
