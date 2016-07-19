(function() {
    'use strict';

    angular.module('mainApp')

    .controller('UserController',
        ['$rootScope', '$scope', '$http',
        function($rootScope, $scope, $http) {

          $scope.error_message = null;
          $rootScope.logged_in = false;
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
            $rootScope.logged_in = true;
            $scope.user.password = '';
          };

          $scope.login = function() {
            $http.post('/api/login', $scope.user)
            .then($scope.loginOK, $scope.loginErr);
          };

          $scope.logout = function() {
            $http.delete('/api/login');
            $rootScope.logged_in = false;
          };

          $scope.checkLoggedIn = function() {
            $http.get('/api/login').then($scope.loginOK);
          };
          $scope.checkLoggedIn();
    }]);
})();
