'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubDirectoryCtrl', ['$scope', 'clubService', 'tagService', ($scope, clubService, tagService) ->
    clubService.getAllClubs().then (response) ->
      $scope.clubs = response
    tagService.getSearchTags().then (response) ->
      $scope.tags = response

    $scope.correctTerms = (element) ->
      element.term == 201340 or element.term == 201310 or element.term == 201240
  ]
