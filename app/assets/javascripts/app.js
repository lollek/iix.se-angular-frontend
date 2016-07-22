(function() {
    'use strict';

    var app = angular.module('mainApp', [
        'ngRoute',
        'ngResource',
        'hc.marked'
    ]);

    app.filter('reverse', function() {
      return function(list) {
        return list.slice().reverse();
      };
    });

    app.config(['$routeProvider', '$locationProvider', '$httpProvider',
        function($routeProvider, $locationProvider, $httpProvider) {
            $locationProvider.html5Mode(true);
            $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

            
            $routeProvider
                .when('/', {templateUrl: '/html/main.html'})
                .when('/404', {templateUrl: '/html/404.html'})

                // User / login
                .when('/user', {
                  templateUrl: '/html/user.html',
                  controller: 'UserController'
                })

                // Notes
                .when('/notes', {
                    templateUrl: '/html/notes.html',
                    controller: 'NotesController'
                })
                .when('/notes/:noteId', {
                    templateUrl: '/html/note.html',
                    controller: 'NotesController'
                })

                // Beerlist
                .when('/beer', {templateUrl: '/html/beer.html'})

                // Wishlist
                .when('/wishlist', {
                  controller: 'BooksController',
                  controllerAs: 'books',
                  templateUrl: '/html/wishlist.html'
                })

                // Moria
                .when('/moria', { templateUrl: '/html/moria.html' })
                .when('/moria/:filepath', {
                  // TODO: Fix recursion if filepath does not exist
                   templateUrl: function (urlattr) {
                       return '/html/moria/' + urlattr.filepath;
                   }
                })

                // Fallthrough
                .otherwise({redirectTo: '/404'});
        }
    ]);
})();
