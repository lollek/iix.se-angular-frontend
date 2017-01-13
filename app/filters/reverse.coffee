reverse = () =>
    (list) => list.slice().reverse();

angular.module('mainApp')
    .filter('reverse', reverse)

