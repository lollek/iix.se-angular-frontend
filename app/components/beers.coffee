beers = {
    controller: ['ngDialog', 'Beer', (ngDialog, Beer) ->
        @beers = Beer.query()
        @editing = false

        @handleOk = () =>
            return

        @handleError = () =>
            ngDialog.open({
                template: '/dialogs/errorDialog.html',
                className: 'ngdialog-theme-default'
            });
            return

        @edit = (value) =>
            @editing = value
            return

        @reload = (index, id) =>
            @beers[index] = Beer.get({ id: id }, @handleOk, @handleError)
            return

        @save = (index, id) =>
            if id
                @beers[index] = Beer.update({ id: id }, @beers[index], @handleOk, @handleError)
            else
                @beers[index] = Beer.save(@beers[index], @handleOk, @handleError)
            return

        @delete = (index, id) =>
            if id
                Beer.delete({ id: id },
                    () => @beers.splice(index, 1),
                    @handleError)
            else
                @beers.splice(index, 1)
            return

        @add = () =>
            @beers.unshift(new Beer())
            return
        return
    ],

    template: '<h1>Beer' +
              '  <button ng-show="!$ctrl.editing && $root.logged_in" ng-click="$ctrl.edit(true)" class="btn btn-primary">Edit</button>' +
              '  <button ng-show="$ctrl.editing" ng-click="$ctrl.edit(false)" class="btn btn-primary">Stop editing</button>' +
              '</h1>' +
              '<button ng-show="$ctrl.editing" ng-click="$ctrl.add()" class="btn btn-primary">Add row</button>' +
              ' <table class="table table-hover table-responsive">' +
              '  <thead>' +
              '    <tr class="header">' +
              '      <th>Name</th>' +
              '      <th>Brewery</th>' +
              '      <th>Percentage</th>' +
              '      <th>Country</th>' +
              '      <th>Type</th>' +
              '      <th>S-Score</th>' +
              '      <th>O-Score</th>' +
              '      <th ng-if="$ctrl.editing"></th>' +
              '      <th ng-if="$ctrl.editing"></th>' +
              '      <th ng-if="$ctrl.editing"></th>' +
              '    </tr>' +
              '  </thead>' +
              '' +
              '  <tbody>' +
              '    <tr ng-repeat="beer in $ctrl.beers">' +
              '      <!-- Viewing -->' +
              '      <td ng-if="!$ctrl.editing">{{beer.name}}</td>' +
              '      <td ng-if="!$ctrl.editing">{{beer.brewery}}</td>' +
              '      <td ng-if="!$ctrl.editing">{{beer.percentage}}</td>' +
              '      <td ng-if="!$ctrl.editing">{{beer.country}}</td>' +
              '      <td ng-if="!$ctrl.editing">{{beer.style}}</td>' +
              '      <td ng-if="!$ctrl.editing">{{beer.sscore}}</td>' +
              '      <td ng-if="!$ctrl.editing">{{beer.oscore}}</td>' +
              '      <!-- Editing -->' +
              '      <td ng-if="$ctrl.editing"><input type="text" ng-model="beer.name"></td>' +
              '      <td ng-if="$ctrl.editing"><input type="text" ng-model="beer.brewery"></td>' +
              '      <td ng-if="$ctrl.editing"><input class="form-control" type="number" ng-model="beer.percentage"></td>' +
              '      <td ng-if="$ctrl.editing"><input type="text" ng-model="beer.country"></td>' +
              '      <td ng-if="$ctrl.editing"><input type="text" ng-model="beer.style"></td>' +
              '      <td ng-if="$ctrl.editing"><input class="form-control" type="number" min="1" max="5" ng-model="beer.sscore"></td>' +
              '      <td ng-if="$ctrl.editing"><input class="form-control" type="number" min="1" max="5" ng-model="beer.oscore"></td>' +
              '      <td ng-if="$ctrl.editing"><button ng-click="$ctrl.save($index, beer.id)" type="button" class="btn btn-success">Save</button></td>' +
              '      <td ng-if="$ctrl.editing"><button ng-click="$ctrl.reload($index, beer.id)" type="button" class="btn btn-warning">Reload</button></td>' +
              '      <td ng-if="$ctrl.editing"><button ng-click="$ctrl.delete($index, beer.id)" type="button" class="btn btn-danger">Delete</button></td>' +
              '    </tr>' +
              '  </tbody>' +
              '</table>'
}

angular.module('mainApp')
    .component('beers', beers)
