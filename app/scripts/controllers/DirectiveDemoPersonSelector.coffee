'use strict'

angular.module('ClubConnectApp')
  .controller 'DirectiveDemoPersonSelectorCtrl', ($scope, personProvider) ->
    $scope.personSearch = personProvider.generalSearch
