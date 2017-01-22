gameThumbnail = {
    bindings: {
        game: '<'
    }
    template:
      '    <div class="thumbnail">' +
      '      <a ng-href="{{ $ctrl.game.link }}">' +
      '        <img ng-src="{{ $ctrl.game.image }}" alt="{{ $ctrl.game.name }}">' +
      '        <div class="caption">' +
      '          <h3 class="text-center">{{ $ctrl.game.name }}</h3>' +
      '        </div>' +
      '      </a>' +
      '    </div>'

}

angular.module('mainApp')
    .component('gameThumbnail', gameThumbnail)