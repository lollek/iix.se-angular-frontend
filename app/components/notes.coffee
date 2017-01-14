notes = {
  controller: ['Note', (Note) ->
      @notes = Note.query()
      return
  ],

  template: '<h1>' +
            'Notes' +
            '<a ng-show="$root.logged_in" href="/notes/new" type="button"' +
            '    class="btn btn-primary">Add note</a>' +
            '</h1>' +
            '' +
            '<div class="list-group">' +
            '    <a class="list-group-item" ng-repeat="note in $ctrl.notes | reverse" ui-sref="note({ noteId: note.id })">' +
            '        <span class="badge">{{note.date}}</span>' +
            '        &raquo;' +
            '        {{note.title}}' +
            '    </a>' +
            '</div>'
}

angular.module('mainApp')
   .component('notes', notes)
