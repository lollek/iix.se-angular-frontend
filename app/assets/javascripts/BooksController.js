(function() {
    'use strict';

    angular.module('mainApp')

    .factory('Book',
        ['$resource',
        function ($resource) {
          return $resource('/books/:id', { id: '@_id'}, {
            update : { method: 'PUT' }
          });
    }])

    .controller('BooksController',
        ['Book', '$rootScope', '$scope', '$routeParams', '$http',
        function(Book, $rootScope, $scope, $routeParams, $http) {

          $scope.edit = false;

          $scope.reset_all = function() {
            $scope.books = Book.query();
            $scope.edit = false;
          };

          $scope.reset_book = function(index, id) {
            $scope.books[index] = Book.get({id: id});
          };

          $scope.save_book = function(index, id) {
            if (id === undefined) {
              $scope.books[index] = Book.save($scope.books[index]);
            } else {
              $scope.books[index] = Book.update({id: id}, $scope.books[index]);
            }
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

          $scope.reset_all();
    }]);
})();
