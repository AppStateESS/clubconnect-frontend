'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubRegistrationCtrl', ['$scope', 'tagService', 'clubService', ($scope, tagService, clubService) ->
    $scope.sdrdata      = {}
    $scope.sdrapi       = {}
    $scope.registration = {}

    tagService.getSearchTags (tags) ->
      $scope.sdrdata.searchTags = tags

    tagService.getElectionTags (tags) ->
      $scope.sdrdata.electionTags = tags

    tagService.getMonthTags (tags) ->
      $scope.sdrdata.monthTags = tags
    
    clubService.getAllClubs (clubs) ->
      $scope.sdrdata.clubs = clubs

    $scope.sdrapi.clubSearch = clubService.clubSearch

    $scope.regstate =
      history: false

    $scope.setHistory = (parent) ->
      $scope.registration.parent = if parent then parent.id else 0
      $scope.regstate.history = true

    $scope.clearHistory = () ->
      $scope.registration.parent = undefined
      $scope.regstate.history = false

    $scope.officers = []

    $scope.newperson = {}

    $scope.registration = {}
  ]
