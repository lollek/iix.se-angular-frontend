beers = {
    controller: ['Beer', (Beer) ->
        @beers = Beer.query()
        @editing = false

        @edit = (value) =>
            @editing = value
            return

        @reset = (index, id) =>
            @beers[index] = Beer.get({ id: id })
            return

        @save = (index, id) =>
            if id
                @beers[index] = Beer.update({ id: id }, @beers[index])
            else
                @beers[index] = Beer.save(@beers[index])
            return

        @delete = (index, id) =>
            if id
                Beer.delete({id: id}, () =>
                    @beers.splice(index, 1))
            else
                @beers.splice(index, 1)
            return

        @add_row = () =>
            @beers.push(new Beer())
            return
        return
    ],

    template: '<h1>Beer' +
              '  <button ng-show="$ctrl.editing" ng-click="$ctrl.edit(true)" class="btn btn-primary">Stop editing</button>' +
              '  <button ng-show="!$ctrl.editing && $root.logged_in" ng-click="$ctrl.edit(false)" class="btn btn-primary">Edit</button>' +
              '</h1>' +
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
              '      <td ng-if="$ctrl.editing"><input class="form-control" type="number" ng-model="beer.sscore"></td>' +
              '      <td ng-if="$ctrl.editing"><input class="form-control" type="number" ng-model="beer.oscore"></td>' +
              '      <td ng-if="$ctrl.editing"><button ng-click="$ctrl.save($index, beer.id)" type="button" class="btn btn-success">Save</button></td>' +
              '      <td ng-if="$ctrl.editing"><button ng-click="$ctrl.reset($index, beer.id)" type="button" class="btn btn-warning">Reset</button></td>' +
              '      <td ng-if="$ctrl.editing"><button ng-click="$ctrl.delete($index, beer.id)" type="button" class="btn btn-danger">Delete</button></td>' +
              '    </tr>' +
              '  </tbody>' +
              '</table>' +
              '<button ng-show="$ctrl.editing" ng-click="$ctrl.add_row()" class="btn btn-primary">Add row</button>'
}

angular.module('mainApp')
    .component('beers', beers)
