'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubRegistrationCtrl', ['$scope', '$routeParams', 'tagService', 'clubService', 'registrationApi', 'officerRequestApi', 'userApi', 'sdrConfig', ($scope, $routeParams, tagService, clubService, registrationApi, officerRequestApi, userApi, sdrConfig) ->
    $scope.sdrdata         = {}
    $scope.officerRequest  =
      officers: []
    $scope.removedOfficers = []

    # true if it's a new registration that doesn't exist on the server
    $scope.isNew = () ->
      not $scope.registration.state or $scope.registration.state in ['New', 'Continuing']

    $scope.registration = registrationApi.get
      registration_id: $routeParams.regid
    , () ->
      $scope.officerRequest = officerRequestApi.get
        officer_request_id: $scope.registration.officer_request_id

    $scope.user = userApi.get()

    tagService.getSearchTags()
      .then (tags) ->
        $scope.sdrdata.searchTags = tags

    tagService.getElectionTags()
      .then (tags) ->
        $scope.sdrdata.electionTags = tags

    tagService.getMonthTags()
      .then (tags) ->
        $scope.sdrdata.monthTags = tags

    clubService.getRoles()
      .then (roles) ->
        $scope.sdrdata.roles = roles
        $scope.sdrdata.roleLookup = {}
        for role in roles
          $scope.sdrdata.roleLookup[role.id] = role.title

    $scope.ckeditorCss = sdrConfig.ckeditorCss
            
    clubService.getAllClubs()
      .then (clubs) ->
        $scope.sdrdata.clubs = clubs

    einValidity = () ->
      if not $scope.registration or not $scope.clubregistration
        return
      $scope.clubregistration.ein.$setValidity 'bank',
        (not $scope.registration.bank and not $scope.registration.ein) or
        (!!$scope.registration.bank and !!$scope.registration.ein)

    $scope.$watch 'registration.ein', einValidity
    $scope.$watch 'registration.bank', einValidity

    $scope.presidentValid = () ->
      if not $scope.officerRequest.officers
        return false
      for person in $scope.officerRequest.officers
        if person.role_id == 34
          return true
      return false

    $scope.advisorValid = () ->
      if not $scope.officerRequest.officers
        return false
      for person in $scope.officerRequest.officers
        if person.role_id == 53
          return true
      return false

    $scope.newOfficer = () ->
      $scope.officerRequest.officers.push
        person_email: ''
        type_id: -1
        admin: false

    $scope.removeOfficer = (key) ->
      $scope.removedOfficers.push $scope.officerRequest.officers.splice(key,1)[0]

    $scope.undoRemoveOfficer = (key) ->
      $scope.officerRequest.officers.push $scope.removedOfficers.splice(key,1)[0]

    $scope.submit = (state) ->
      oldstate = $scope.registration.state
      $scope.registration.state = state

      $scope.registration.$save()

  ]
