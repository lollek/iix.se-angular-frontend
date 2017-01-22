booksEditView = {
    controller: ['ngDialog', 'Book', (ngDialog, Book) ->
        @handleOk = () =>
            return

        @handleError = () =>
            ngDialog.open({
                template: '/dialogs/errorDialog.html',
                className: 'ngdialog-theme-default'
            });
            return

        @reload = (index, id) =>
            @books[index] = Book.get({ id: id }, @handleOk, @handleError)
            return

        @save = (index, id) =>
            if id
                @books[index] = Book.update({ id: id }, @books[index], @handleOk, @handleError)
            else
                @books[index] = Book.save(@books[index], @handleOk, @handleError)
            return

        @delete = (index, id) =>
            if id
                Book.delete({ id: id },
                    () => @books.splice(index, 1),
                  @handleError)
            else
                @books.splice(index, 1)
            return

        @add = () =>
            @books.unshift(new Book())
            return
        return
    ],
    bindings: {
        books: '='
    },
    template:
        '<div>' +
        '  <button ng-click="$ctrl.add()" class="btn btn-primary">Add row</button>' +
        '  <table ng-if="$ctrl.books.$resolved" class="table table-hover table-responsive">' +
        '  <thead>' +
        '    <tr class="header">' +
        '      <th>Title</th>' +
        '      <th>Author</th>' +
        '      <th>Other</th>' +
        '      <th>Image</th>' +
        '    </tr>' +
        '  </thead>' +
        '  <tbody>' +
        '    <tr ng-repeat="book in $ctrl.books">' +
        '      <td><input type="text" ng-model="book.title"></td>' +
        '      <td><input type="text" ng-model="book.author"></td>' +
        '      <td><input type="text" ng-model="book.other">' +
        '      <td><input type="text" ng-model="book.image">' +
        '      <td><button ng-click="$ctrl.save($index, book.id)" type="button" class="btn btn-success">Save</button></td>' +
        '      <td><button ng-click="$ctrl.reload($index, book.id)" type="button" class="btn btn-warning">Reload</button></td>' +
        '      <td><button ng-click="$ctrl.delete($index, book.id)" type="button" class="btn btn-danger">Delete</button></td>' +
        '    </tr>' +
        '  </tbody>' +
        '</div>'
}

angular.module('mainApp')
    .component('booksEditView', booksEditView)