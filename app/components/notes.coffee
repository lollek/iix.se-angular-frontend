notes = {
  controller: ['Note', (Note) ->
      @notes = Note.query()
      return
  ],

  template:
      '<div>' +
      '  <h1>' +
      '    Notes' +
      '    <a ng-show="$root.logged_in" ui-sref="note({ noteId: \'new\' })" type="button" class="btn btn-primary">Add note</a>' +
      '  </h1>' +
      '  <loading-spinner ng-if="!$ctrl.notes.$resolved"></loading-spinner>' +
      '  <div ng-show="$ctrl.notes.$resolved" class="list-group">' +
      '    <a class="list-group-item" ng-repeat="note in $ctrl.notes | reverse" ui-sref="note({ noteId: note.id })">' +
      '      <span class="badge">{{note.date}}</span>' +
      '      &raquo;' +
      '      {{note.title}}' +
      '    </a>' +
      '  </div>' +
      '</div>'
}

angular.module('mainApp')
   .component('notes', notes)
