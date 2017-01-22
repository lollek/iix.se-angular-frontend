games = {
  controller: ['Game', (Game) ->
      @games = Game.query();
      return
  ],
  template:
      '<div class="col-xs-12">' +
      '  <h1>Games</h1>' +
      '  <h3 ng-if="!$ctrl.games.$resolved">Loading ' +
      '    <span class="glyphicon glyphicon-refresh spinning"></span>' +
      '  </h3>' +
      '  <div ng-show="$ctrl.games.$resolved" class="row">' +
      '    <div ng-repeat="game in $ctrl.games" class="col-xs-12 col-sm-4 col-md-3 col-lg-2">' +
      '      <game-thumbnail game="game"></game-thumbnail>' +
      '    </div>' +
      '  </div>' +
      '</div>'
}

angular.module('mainApp')
    .component('games', games)
