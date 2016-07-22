angular.module('mainApp', [
    'ngRoute',
    'ngResource',
    'hc.marked'
])

FilterReverse = () ->
    (list) -> list.slice().reverse()

Config = ($routeProvider, $locationProvider, $httpProvider) ->
    $locationProvider.html5Mode(true)
    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      $('meta[name=csrf-token]').attr('content')

    $routeProvider
          .when('/', {templateUrl: '/html/main.html'})
          .when('/404', {templateUrl: '/html/404.html'})

          # User / login
          .when('/user', {
              templateUrl: '/html/user.html',
              controller: 'UserController'
          })

          # Notes
          .when('/notes', {
                templateUrl: '/html/notes.html',
                controller: 'NotesController'
          })
          .when('/notes/:noteId', {
                templateUrl: '/html/note.html',
                controller: 'NotesController'
          })

          # Beerlist
          .when('/beer', {templateUrl: '/html/beer.html'})

          # Wishlist
          .when('/wishlist', {
              controller: 'BooksController',
              controllerAs: 'books',
              templateUrl: '/html/wishlist.html'
          })

          # Moria
          .when('/moria', { templateUrl: '/html/moria.html' })
          .when('/moria/:filepath', {
               # TODO: Fix recursion if filepath does not exist
               templateUrl: (urlattr) ->
                   '/html/moria/' + urlattr.filepath
          })

Config
    .$inject = ['$routeProvider', '$locationProvider', '$httpProvider']

angular.module('mainApp')
    .filter('reverse', FilterReverse)
    .config(Config)
