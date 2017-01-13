NotesController = ['$routeParams', '$location', 'Note', ($routeParams, $location, Note) ->
    init = () =>
        @edit = edit
        @save = save
        @discard = discard
        @remove = remove

        @editing = false

        if $routeParams.noteId == 'new'
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
]


notes = {
  templateUrl: '/templates/notes.html',
  controller: NotesController
}

angular.module('mainApp')
  .component('notes', notes)
