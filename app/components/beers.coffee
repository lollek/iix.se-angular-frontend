beers = {
    controller: ['ngDialog', 'Beer', (ngDialog, Beer) ->
        @beers = Beer.query()
        @editing = false
        @sortBy = 'name'
        @sortReverse = false
        @filter = ''

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
            Beer beer = new Beer()
            beer.name = ''
            @beers.unshift(beer)
            return

        @sort = (sort) =>
            @sortBy = sort
            @sortReverse = !@sortReverse
        return
    ],

    template: '<h1>Beer' +
              '  <button ng-show="!$ctrl.editing && $root.logged_in" ng-click="$ctrl.edit(true)" class="btn btn-primary">Edit</button>' +
              '  <button ng-show="$ctrl.editing" ng-click="$ctrl.edit(false)" class="btn btn-primary">Stop editing</button>' +
              '</h1>' +
              '<button ng-show="$ctrl.editing" ng-click="$ctrl.add()" class="btn btn-primary">Add row</button>' +
              '<form>' +
              '  <div class="form-group">' +
              '    <div class="input-group">' +
              '      <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>' +
              '      <input type="text" class="form-control" placeholder="Filter" ng-model="$ctrl.filter">' +
              '      </div>' +
              '    </div>' +
              '</form>' +
              ' <table class="table table-hover table-responsive">' +
              '  <thead>' +
              '    <tr class="header">' +
              '      <th><a href target="_self" ng-click="$ctrl.sort(\'name\')">Name</a></th>' +
              '      <th><a href target="_self" ng-click="$ctrl.sort(\'brewery\')">Brewery</a></th>' +
              '      <th><a href target="_self" ng-click="$ctrl.sort(\'percentage\')">Percentage</a></th>' +
              '      <th><a href target="_self" ng-click="$ctrl.sort(\'country\')">Country</a></th>' +
              '      <th><a href target="_self" ng-click="$ctrl.sort(\'type\')">Type</a></th>' +
              '      <th><a href target="_self" ng-click="$ctrl.sort(\'sscore\')">S-Score</a></th>' +
              '      <th><a href target="_self" ng-click="$ctrl.sort(\'oscore\')">O-Score</a></th>' +
              '      <th ng-if="$ctrl.editing"></th>' +
              '      <th ng-if="$ctrl.editing"></th>' +
              '      <th ng-if="$ctrl.editing"></th>' +
              '    </tr>' +
              '  </thead>' +
              '' +
              '  <tbody>' +
              '    <tr ng-repeat="beer in $ctrl.beers | orderBy:$ctrl.sortBy:$ctrl.sortReverse | filter:$ctrl.filter">' +
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
