bookThumbnail = {
    bindings: {
        book: '<'
    },
    template:
      '<div class="thumbnail">' +
      '  <img ng-src="{{ $ctrl.book.image }}" alt="{{ $ctrl.book.title }}">' +
      '  <div class="caption">' +
      '    <h3 class="text-center">{{ $ctrl.book.title }}</h3>' +
      '    <p class="text-center">{{ $ctrl.book.other }}</p> ' +
      '  </div>' +
      '</div>'
}

angular.module('mainApp')
    .component('bookThumbnail', bookThumbnail)