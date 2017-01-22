games = {
  controller: ['Game', (Game) ->
      @games = Game.query();
      return
  ],
  template: '<h1>Games</h1>' +
            '<div class="row">' +
            '  <div ng-repeat="game in $ctrl.games" class="col-xs-4 col-sm-3 col-md-2">' +
            '    <div class="thumbnail">' +
            '      <a ng-href="{{ game.link }}">' +
            '        <img ng-src="{{ game.image }}" alt="{{ game.name }}">' +
            '        <div class="caption">' +
            '          <h3>{{ game.name }}</h3>' +
            '        </div>' +
            '      </a>' +
            '    </div>' +
            '  </div>' +
            '</div>'
}

angular.module('mainApp')
    .component('games', games)
