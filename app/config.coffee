Config = ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state({ name: 'index', url: '/',     templateUrl: '/partials/main.html' })
  .state({ name: '404',   url: '/404',  templateUrl:  '/partials/404.html' })

  .state({ name: 'beers', url: '/beers', template: '<beers></beers>' })

  .state({ name: 'note',  url: '/note/:noteId', template: '<note></note>' })
  .state({ name: 'notes',  url: '/notes', template: '<notes></notes>' })

]
# # Wishlist
#   .when('/wishlist', {
#   controller: 'BooksController',
#   controllerAs: 'books',
#   templateUrl: '/html/books/view.html'
# })
#   .when('/wishlist/edit', {
#   controller: 'BooksController',
#   controllerAs: 'books',
#   templateUrl: '/html/books/edit.html'
# })

# Moria
#   .when('/moria', { templateUrl: '/html/moria.html' })
#   .when('/moria/:filepath', {
# TODO: Fix recursion if filepath does not exist
#   templateUrl: (urlattr) ->
#     '/html/moria/' + urlattr.filepath
# })

  # Markdown
#   .when('/sofie', {
#   controller: 'MarkdownController',
#   controllerAs: 'markdown',
#   templateUrl: '/html/markdown.html'
# })

#   .otherwise({redirectTo: '/404'})

angular.module('mainApp')
    .config(Config)
