games = {
  controller: ['Game', (Game) ->
      @games = Game.query();
      return
  ],
  template: '<h1>Games</h1>' +
            '<h3 ng-if="!$ctrl.games.$resolved">Loading ' +
            '  <span class="glyphicon glyphicon-refresh spinning"></span>' +
            '</h3>' +
            '<div ng-show="$ctrl.games.$resolved" class="row">' +
            '  <div ng-repeat="game in $ctrl.games" class="col-xs-12 col-sm-4 col-md-3 col-lg-2">' +
            '    <div class="thumbnail">' +
            '      <a ng-href="{{ game.link }}">' +
            '        <img ng-src="{{ game.image }}" alt="{{ game.name }}">' +
            '        <div class="caption">' +
            '          <h3 class="text-center">{{ game.name }}</h3>' +
            '        </div>' +
            '      </a>' +
            '    </div>' +
            '  </div>' +
            '</div>'
}

angular.module('mainApp')
    .component('games', games)
