(function() {
    'use strict';

    angular.module('mainApp')

    .factory('Note',
        ['$resource',
        function ($resource) {
          return $resource('/api/notes/:id', { id: '@_id' }, {
            update: { method: 'PUT' }
          });
    }])


    .controller('NotesController',
        ['Note', '$scope', '$routeParams',
        function(Note, $scope, $routeParams) {

          $scope.editing = false;

          $scope.add_note = function() {
            $scope.notes.push(new Note());
          };

          $scope.edit = function() {
            $scope.editing = true;
          };

          $scope.save = function() {
            if ($scope.note.id === undefined) {
              $scope.note = Note.save($scope.note);
            } else {
              $scope.note = Note.update({id: $routeParams.noteId}, $scope.note);
            }
            $scope.editing = false;
          };

          $scope.discard = function() {
            $scope.note = Note.get({id: $routeParams.noteId});
            $scope.editing = false;
          };

          $scope.delete = function(index, id) {
            $scope.notes.splice(index, 1);
            if (id !== undefined) {
              Note.delete({id: id});
            }
          };

          // notes.html
          if ($routeParams.noteId === undefined) {
            $scope.notes = Note.query();

          // note.html
          } else {
            $scope.note = Note.get({ id: $routeParams.noteId });
          }

    }]);
})();
