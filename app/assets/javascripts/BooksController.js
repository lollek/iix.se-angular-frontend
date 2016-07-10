(function() {
    'use strict';

    angular.module('mainApp')

    .factory('BooksService',
        ['$resource',
        function ($resource) {
          return $resource('/books');
    }])

    .controller('BooksController',
        ['BooksService', '$scope', '$routeParams', '$http',
        function(BooksService, $scope, $routeParams, $http) {

          $scope.books = BooksService.query();
    }]);
})();
