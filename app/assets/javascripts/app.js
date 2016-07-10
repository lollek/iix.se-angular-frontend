(function() {
    'use strict';

    var app = angular.module('mainApp', [
        'ngRoute',
        'ngResource'
    ]);

    app.config(['$routeProvider', '$locationProvider',
        function($routeProvider, $locationProvider) {
            $locationProvider.html5Mode(true);
            
            $routeProvider
                .when('/', {templateUrl: '/html/main.html'})
                .when('/404', {templateUrl: '/html/404.html'})

                // Notes
                .when('/notes', {
                    templateUrl: '/html/notes.html',
                    controller: 'NotesController'
                })
                .when('/notes/:noteId', {
                    templateUrl: '/html/note.html',
                    controller: 'NotesController'
                })

                // Lists
                .when('/beer', {templateUrl: '/html/beer.html'})
                .when('/wishlist', {
                  controller: 'BooksController',
                  templateUrl: '/html/wishlist.html'
                })
                .when('/booklist', {templateUrl: '/books'})

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
