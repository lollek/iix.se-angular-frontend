books = {
    controller: ['ngDialog', 'Book', (ngDialog, Book) ->
        @editing = false
        @books = Book.query()

        @handleOk = () =>
            return

        @handleError = () =>
            ngDialog.open({
                template: '/dialogs/errorDialog.html',
                className: 'ngdialog-theme-default'
            });
            return

        @edit = (value) =>
            @editing = value
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

    template: '<h1>Books' +
              '  <button ng-if="$ctrl.editing" ng-click="$ctrl.edit(false)" class="btn btn-primary">Stop editing</button>' +
              '  <button ng-if="!$ctrl.editing && $root.logged_in" ng-click="$ctrl.edit(true)" class="btn btn-primary">Edit</button>' +
              '</h1>' +
              '<h3 ng-if="!$ctrl.books.$resolved">Loading ' +
              '  <span class="glyphicon glyphicon-refresh spinning"></span>' +
              '</h3>' +
              '<table ng-show="$ctrl.books.$resolved" class="table table-hover table-responsive">' +
              '<thead>' +
              '  <tr class="header">' +
              '    <th>Title</th>' +
              '    <th>Author</th>' +
              '    <th>Other</th>' +
              '    <th ng-if="$ctrl.editing"></th>' +
              '    <th ng-if="$ctrl.editing"></th>' +
              '    <th ng-if="$ctrl.editing"></th>' +
              '  </tr>' +
              '</thead>' +
              '<tbody>' +
              '  <tr ng-repeat="book in $ctrl.books">' +
              '    <!-- Viewing -->' +
              '    <td ng-if="!$ctrl.editing">{{book.title}}</td>' +
              '    <td ng-if="!$ctrl.editing">{{book.author}}</td>' +
              '    <td ng-if="!$ctrl.editing">{{book.other}}</td>' +
              '    <!-- Editing -->' +
              '    <td ng-if="$ctrl.editing"><input type="text" ng-model="book.title"></td>' +
              '    <td ng-if="$ctrl.editing"><input type="text" ng-model="book.author"></td>' +
              '    <td ng-if="$ctrl.editing"><input type="text" ng-model="book.other">' +
              '    <td ng-if="$ctrl.editing"><button ng-click="$ctrl.save($index, book.id)" type="button" class="btn btn-success">Save</button></td>' +
              '    <td ng-if="$ctrl.editing"><button ng-click="$ctrl.reload($index, book.id)" type="button" class="btn btn-warning">Reload</button></td>' +
              '    <td ng-if="$ctrl.editing"><button ng-click="$ctrl.delete($index, book.id)" type="button" class="btn btn-danger">Delete</button></td>' +
              '  </tr>' +
              '</tbody>' +
              '<button ng-if="$ctrl.editing" ng-click="$ctrl.add()" class="btn btn-primary">Add row</button>'
}

angular.module('mainApp')
    .component('books', books)