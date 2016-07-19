(function() {
    'use strict';

    angular.module('mainApp')

    .controller('UserController',
        ['$scope', '$http', function($scope, $http) {

          $scope.error_message = null;
          $scope.logged_in = false;
          $scope.user = {
            username: '',
            password: ''
          };

          $scope.loginERR = function(res) {
            $scope.error_message = res.statusText;
            $scope.user.password = '';
          };

          $scope.loginOK = function(res) {
            $scope.user.username = res.data;
            $scope.error_message = null;
            $scope.logged_in = true;
            $scope.user.password = '';
          };

          $scope.login = function() {
            $http.post('/api/login', $scope.user)
            .then($scope.loginOK, $scope.loginErr);
          };

          $scope.logout = function() {
            $http.delete('/api/login');
            $scope.logged_in = false;
          };

          $scope.checkLoggedIn = function() {
            $http.get('/api/login').then($scope.loginOK);
          };
          $scope.checkLoggedIn();
    }]);
})();
