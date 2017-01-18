note = {
  controller: ['$stateParams', 'ngDialog', 'Note', ($stateParams, ngDialog, Note) ->
    @noteId = $stateParams.noteId

    @handleOk = () =>
      return

    @handleError = () =>
      ngDialog.open({
        template: '/dialogs/errorDialog.html',
        className: 'ngdialog-theme-default'
      });
      return

    if @noteId == 'new'
        @note = new Note()
        @note.date = new Date(Date.now()).toISOString().slice(0,10)
        @editing = true
    else
        @note = Note.get({ id: @noteId }, @handleOk, @handleError)
        @editing = false

    @edit = () =>
        @editing = true
        return

    @save = () =>
        @editing = false
        if @note.id is undefined
            @note = Note.save(@note,
              (res) -> $location.path('/notes/' + res.id),
              @handleError)
        else
            @note = Note.update({ id: @noteId }, @note, @handleOk, @handleError)
        return

    @reload = () =>
        @editing = false
        @note = Note.get({ id: @noteId }, @handleOk, @handleError)
        return

    @remove = () =>
        # @notes.splice(index, 1) where index = note with id = @noteId
        Note.delete({ id: @noteId }, @handleOk, @handleError) if @noteId != 'new'
        return
    return
],

  template: '<div class="page-header">' +
            '  <!-- Viewing -->' +
            '  <div ng-hide="$ctrl.editing">' +
            '    <h1 ng-bind="$ctrl.note.title"></h1>' +
            '    <button ng-show="$root.logged_in" ng-click="$ctrl.edit()" type="button" class="btn btn-primary">Edit</button>' +
            '    <div ng-hide="$ctrl.editing" marked="$ctrl.note.text">' +
            '    </div>' +
            '  </div>' +
            '' +
            '  <!-- Editing -->' +
            '  <div ng-show="$ctrl.editing">' +
            '    <input type="text" class="form-control" ng-model="$ctrl.note.title" placeholder="Title">' +
            '    <input typetime="yyyy-MM-dd" class="form-control" ng-model="$ctrl.note.date">' +
            '    <button ng-click="$ctrl.save()" type="button" class="btn btn-success">Save</button>' +
            '    <button ng-click="$ctrl.reload()" type="button" class="btn btn-warning">Reload</button>' +
            '    <div class="form-group row">' +
            '      <div class="col-md-12">' +
            '        <textarea class="form-control" ng-model="$ctrl.note.text" rows="20"></textarea>' +
            '      </div>' +
            '    </div>' +
            '  </div>' +
            '</div>'
}

angular.module('mainApp')
    .component('note', note)
