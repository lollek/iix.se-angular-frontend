note = {
  controller: ['$state', '$stateParams', 'ngDialog', 'Note', ($state, $stateParams, ngDialog, Note) ->
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
              (res) -> $state.go('note', { noteId: res.id }),
              @handleError)
        else
            @note = Note.update({ id: @noteId }, @note, @handleOk, @handleError)
        return

    @reload = () =>
        @editing = false
        if (@noteId == 'new')
            $state.go('notes')
        else
            @note = Note.get({ id: @noteId }, @handleOk, @handleError)
        return

    @remove = () =>
        if (@noteId != 'new')
            Note.delete({ id: @noteId }, @handleOk, @handleError)
        $state.go('notes')
        return
    return
],

  template: '<div class="page-header">' +
            '  <!-- Viewing -->' +
            '  <div ng-hide="$ctrl.editing">' +
            '    <button ng-show="$root.logged_in" ng-click="$ctrl.remove()" type="button" class="btn btn-danger">Delete</button>' +
            '    <button ng-show="$root.logged_in" ng-click="$ctrl.edit()" type="button" class="btn btn-primary">Edit</button>' +
            '    <h1 ng-bind="$ctrl.note.title"></h1>' +
            '    <div ng-hide="$ctrl.editing" marked="$ctrl.note.text">' +
            '    </div>' +
            '  </div>' +
            '' +
            '  <!-- Editing -->' +
            '  <div ng-show="$ctrl.editing">' +
            '    <input type="text" class="form-control" ng-model="$ctrl.note.title" placeholder="Title">' +
            '    <input typetime="yyyy-MM-dd" class="form-control" ng-model="$ctrl.note.date">' +
            '    <button ng-click="$ctrl.save()" type="button" class="btn btn-success">Save</button>' +
            '    <button ng-click="$ctrl.reload()" type="button" class="btn btn-warning">Cancel</button>' +
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
