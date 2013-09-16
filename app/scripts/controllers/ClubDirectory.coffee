'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubDirectoryCtrl', ['$scope', 'clubService', 'tagService', 'clubRegUrl', 'userType', ($scope, clubService, tagService, clubRegUrl, userType) ->
    clubService.getAllClubs().then (response) ->
      $scope.clubs = response
    tagService.getSearchTags().then (response) ->
      $scope.tags = response

    $scope.url =
      clubreg: clubRegUrl

    $scope.user =
      type: userType

    $scope.forClubDirectory = (element) ->
      (element.term == 201340 or element.term == 201310 or element.term == 201240) &&
        (element.student_managed == 1)

    $scope.orderClubDirectory = (element) ->
      element.fullname
        .replace(/^(ASU|Appalachian( State)?( University)?) /i, '')

    $scope.clubRowClicked = (href) ->
      window.location = href
  ]
