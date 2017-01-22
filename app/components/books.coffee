books = {
    controller: ['ngDialog', 'Book', (ngDialog, Book) ->
        @editing = false
        @books = Book.query()

        @edit = (value) =>
            @editing = value
            return
        return
    ],

    template:
        '<div class="col-xs-12">' +
        '  <h1>Books' +
        '    <button ng-if="$ctrl.editing" ng-click="$ctrl.edit(false)" class="btn btn-primary">Stop editing</button>' +
        '    <button ng-if="!$ctrl.editing && $root.logged_in" ng-click="$ctrl.edit(true)" class="btn btn-primary">Edit</button>' +
        '  </h1>' +
        '  <loading-spinner ng-if="!$ctrl.books.$resolved"></loading-spinner>' +
        '  <books-list-view ng-if="!$ctrl.editing" books="$ctrl.books"></books-list-view>' +
        '  <books-edit-view ng-if="$ctrl.editing" books="$ctrl.books"></books-edit-view>' +
        '</div>'
}

angular.module('mainApp')
    .component('books', books)