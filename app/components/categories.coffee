categories = {
    controller: [() ->
        @categories = [
            { route: 'notes', image: '/img/notes.png'},
            { route: 'beers', image: '/img/beers.png'},
            { route: 'wishlist', image: '/img/wishlist.png'},
            { route: 'moria', image: '/img/moria.png'}
        ]
        return
    ],
    template:
        '<div class="row">' +
        '  <div ng-repeat="category in $ctrl.categories" class="col-sm-6 col-md-4">' +
        '    <category-thumbnail route="category.route" image="category.image"></category-thumbnail>' +
        '  </div>' +
        '</div>'
}

angular.module('mainApp')
    .component('categories', categories)