loadingSpinner = {
    template:
        '<h3>Loading ' +
        '  <span class="glyphicon glyphicon-refresh spinning"></span>' +
        '</h3>'
}

angular.module('mainApp')
    .component('loadingSpinner', loadingSpinner)