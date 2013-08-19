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

    clubService.getRoles()
      .then (roles) ->
        $scope.sdrdata.roles = roles
        $scope.sdrdata.roleLookup = {}
        for role in roles
          $scope.sdrdata.roleLookup[role.id] = role.title
            
    clubService.getAllClubs (clubs) ->
      $scope.sdrdata.clubs = clubs

    $scope.sdrapi.clubSearch = clubService.clubSearch

    $scope.sdrapi.getRegistration = clubService.getRegistration

    $scope.regstate =
      history: false

    $scope.setHistory = (parent) ->
      $scope.registration.parent = if parent then parent.id else 0
      $scope.regstate.history = true

      # Load the data graciously sent us from the server
      $scope.registration.fullname    = parent.fullname
      $scope.registration.shortname   = parent.shortname
      $scope.registration.address     = parent.address
      $scope.registration.bank        = parent.bank
      $scope.registration.ein         =
        if parent.ein then '**-********' else ''

      # TODO: Election Tags, Search Tags

      $scope.registration.purpose     = parent.purpose
      $scope.registration.description = parent.description
      $scope.registration.meetings    = parent.meetings
      $scope.registration.location    = parent.location
      $scope.registration.website     = parent.website

      $scope.registration.elections   = parent.elections

      $scope.registration.officers    = parent.officers

    $scope.clearHistory = () ->
      $scope.registration.parent = undefined
      $scope.regstate.history = false

    $scope.newperson = {}

    $scope.registration = {}

    $scope.sdrapi.newOfficer = () ->
      $scope.registration.officers.push
        email: ''
        position: ''
        admin: false

    $scope.sdrapi.removeOfficer = (key) ->
      $scope.registration.officers[key].removed = true

    $scope.sdrapi.undoRemoveOfficer = (key) ->
      $scope.registration.officers[key].removed = false

  ]
