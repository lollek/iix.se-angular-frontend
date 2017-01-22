categoryThumbnail = {
    bindings: {
        route: '<',
        image: '<'
    },
    template:
        '<div class="thumbnail">' +
        '  <a ui-sref="{{ $ctrl.route }}">' +
        '    <img ng-src="{{ $ctrl.image }}" alt="{{ $ctrl.route }}">' +
        '    <div class="caption">' +
        '      <h3 class="text-capitalize">{{ $ctrl.route }}</h3>' +
        '    </div>' +
        '  </a>' +
        '</div>'
}

angular.module('mainApp')
    .component('categoryThumbnail', categoryThumbnail)