'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubDirectoryCtrl', ['$scope', 'sdrConfig', 'clubService', 'tagService', 'userApi', ($scope, sdrConfig, clubService, tagService, userApi) ->
    clubService.getAllClubs().then (response) ->
      $scope.clubs = response
    tagService.getSearchTags().then (response) ->
      $scope.tags = response

    $scope.url =
      clubreg: sdrConfig.clubRegUrl

    $scope.user = userApi.get()

    $scope.forClubDirectory = (element) ->
      (element.term == 201340 or element.term == 201310 or element.term == 201240) &&
        (element.student_managed == 1)

    $scope.orderClubDirectory = (element) ->
      element.fullname
        .replace(/^(ASU|Appalachian( State)?( University)?) /i, '')

    $scope.clubRowClicked = (href) ->
      window.location = href
  ]
