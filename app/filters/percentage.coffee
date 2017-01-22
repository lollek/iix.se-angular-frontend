percentage = ['$filter', ($filter) =>
  (input, decimals) =>
      num = $filter('number')(input, decimals)
      return if num then num + '%' else '?'
]

angular.module('mainApp')
    .filter('percentage', percentage)
