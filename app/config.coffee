Config = ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    $stateProvider
    .state({ name: 'index', url: '/',     template: '<categories></categories>' })
    .state({ name: 'index2', url: '',     template: '<categories></categories>' })
    .state({ name: '404',   url: '/404',  templateUrl:  '/partials/404.html' })

    .state({ name: 'beers', url: '/beers', template: '<beers></beers>' })

    .state({ name: 'note',  url: '/note/:noteId', template: '<note></note>' })
    .state({ name: 'notes',  url: '/notes', template: '<notes></notes>' })

    .state({ name: 'sofie', url: '/sofie', template: '<markdown></markdown>' })

    .state({ name: 'wishlist', url: '/wishlist', template: '<wishlist></wishlist>' })

    # Moria is a bit hacky, clean this up later
    .state({ name: 'moria', url: '/moria', templateUrl: '/partials/moria/index.html' })
    .state({ name: 'moriapage', url: '/moria/:page', templateUrl: ($stateParams) => '/partials/moria/' + $stateParams.page + '.html' })

    $urlRouterProvider.otherwise('/404')
]

angular.module('mainApp')
    .config(Config)
