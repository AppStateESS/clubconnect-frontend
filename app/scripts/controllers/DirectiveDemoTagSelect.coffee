'use strict'

angular.module('ClubConnectApp')
  .controller 'DirectiveDemoTagSelectCtrl', ['$scope', ($scope) ->
    $scope.tags = [
        title: 'Special Interest'
        selected: false
      ,
        title: 'Multicultural'
        selected: false
      ,
        title: 'Religious'
        selected: false
      ,
        title: 'Political'
        selected: false
      ,
        title: 'Athletic'
        selected: false
    ]
    $scope.isActive = (item) -> !!item.selected
  ]
