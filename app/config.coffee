Config = ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    $stateProvider
    .state({ name: 'index', url: '/',     templateUrl: '/partials/main.html' })
    .state({ name: '404',   url: '/404',  templateUrl:  '/partials/404.html' })

    .state({ name: 'beers', url: '/beers', template: '<beers></beers>' })

    .state({ name: 'note',  url: '/note/:noteId', template: '<note></note>' })
    .state({ name: 'notes',  url: '/notes', template: '<notes></notes>' })

    .state({ name: 'wishlist', url: '/wishlist', template: '<wishlist></wishlist>' })

    $urlRouterProvider.otherwise('/404')
]
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


angular.module('mainApp')
    .config(Config)
