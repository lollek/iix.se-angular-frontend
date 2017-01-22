booksListView = {
    bindings: {
        books: '<',
    },
    template:
        '<div ng-repeat="book in $ctrl.books" class="col-xs-12 col-sm-4 col-md-3 col-lg-2">' +
        '  <book-thumbnail book="book"></book-thumbnail>' +
        '</div>'
}

angular.module('mainApp')
    .component('booksListView', booksListView)