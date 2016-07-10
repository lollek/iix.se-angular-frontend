(function() {
    'use strict';

    var app = angular.module('mainApp', [
        'ngRoute'
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
                .when('/wishlist', {templateUrl: '/html/wishlist.html'})

                // Moria
                .when('/moria', { templateUrl: '/html/moria.html' })
                .when('/moria/:filepath', {
                   templateUrl: function (urlattr) {
                       return '/html/moria/' + urlattr.filepath;
                   }
                })

                // Fallthrough
                .otherwise({redirectTo: '/404'});
        }
    ]);
})();