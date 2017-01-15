books = {
    controller: ['Book', (Book) ->
        @editing = false
        @books = Book.query()

        @edit = (value) =>
            @editing = value

        @reload = (index, id) =>
            @books[index] = Book.get({ id: id })
            return

        @save = (index, id) =>
            if id
                @books[index] = Book.update({ id: id }, @books[index])
            else
                @books[index] = Book.save(@books[index])
            return

        @delete = (index, id) =>
            if id
                Book.delete({ id: id },
                  () => @books.splice(index, 1))
            else
                @books.splice(index, 1)
            return

        @add = () =>
            @books.push(new Book())
            return
        return
    ],

    template: '<h1>Books' +
              '  <button ng-if="$ctrl.editing" ng-click="$ctrl.edit(false)" class="btn btn-primary">Stop editing</button>' +
              '  <button ng-if="!$ctrl.editing && $root.logged_in" ng-click="$ctrl.edit(true)" class="btn btn-primary">Edit</button>' +
              '</h1>' +
              '<table class="table table-hover table-responsive">' +
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
              '    <td ng-if="$ctrl.editing"><button ng-click="$ctrl.save_book($index, book.id)" type="button" class="btn btn-success">Save</button></td>' +
              '    <td ng-if="$ctrl.editing"><button ng-click="$ctrl.reload($index, book.id)" type="button" class="btn btn-warning">Reload</button></td>' +
              '    <td ng-if="$ctrl.editing"><button ng-click="$ctrl.delete_book($index, book.id)" type="button" class="btn btn-danger">Delete</button></td>' +
              '  </tr>' +
              '</tbody>' +
              '<button ng-if="$ctrl.editing" ng-click="$ctrl.add()" class="btn btn-primary">Add row</button>'
}

angular.module('mainApp')
    .component('books', books)