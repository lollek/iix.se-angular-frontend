markdown = {
    controller: ['$state', 'MarkdownText', ($state, MarkdownText) ->
        @handleOk = () =>
            return

        @handleError = () =>
            ngDialog.open({
                template: '/dialogs/errorDialog.html',
                className: 'ngdialog-theme-default'
            });
            return

        @edit = () =>
            @editing = true
            return

        @save = () =>
            @editing = false
            @content = MarkdownText.update({ id: @id }, @content, @handleOk, @handleError)
            return

        @discard = () =>
            @editing = false
            @content = MarkdownText.get({ id: @id }, @handleOk, @handleError)
            return

        @id = switch $state.current.name
            when 'sofie' then 'sofie'
            else $state.go('404')

        @content = MarkdownText.get({ id: @id }, @handleOk, @handleError)
        @editing = false
        return
    ],

    template: '<div ng-show="$root.logged_in" class="form-group row">' +
              '  <div class="page-header">' +
              '    <button ng-hide="$ctrl.editing" ng-click="$ctrl.edit()" type="button" class="btn btn-primary">Edit</button>' +
              '    <button ng-show="$ctrl.editing" ng-click="$ctrl.save()" type="button" class="btn btn-success">Save</button>' +
              '    <button ng-show="$ctrl.editing" ng-click="$ctrl.discard()" type="button" class="btn btn-danger">Throw away changes</button>' +
              '  </div>' +
              '</div>' +
              '<div ng-show="$ctrl.editing" class="col-md-12">' +
              '  <textarea class="form-control" ng-model="$ctrl.content.data" rows="20"></textarea>' +
              '</div>' +
              '<div ng-hide="$ctrl.editing" marked="$ctrl.content.data">' +
              '</div>'
}

angular.module('mainApp')
    .component('markdown', markdown)
