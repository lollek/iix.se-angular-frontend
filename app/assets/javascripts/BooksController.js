(function() {
    'use strict';

    angular.module('mainApp')

    .factory('Book',
        ['$resource',
        function ($resource) {
          return $resource('/books/:id');
    }])

    .controller('BooksController',
        ['Book', '$scope', '$routeParams', '$http',
        function(Book, $scope, $routeParams, $http) {

          $scope.edit = false;

          $scope.refresh = function() {
            $scope.books = Book.query();
          };

          $scope.reset_book = function(index, id) {
            $scope.books[index] = Book.get({id: id});
          };

          $scope.save_book = function(index, id) {
            Book.save($scope.books[index]);
          };

          $scope.delete_book = function(index, id) {
            $scope.books.splice(index, 1);
            if (id !== undefined) {
              Book.delete({id: id});
            }
          };

          $scope.add_row = function() {
            $scope.books.push(new Book());
          };

          $scope.refresh();
    }]);
})();
