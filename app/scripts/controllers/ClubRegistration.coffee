'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubRegistrationCtrl', ['$scope', 'tagService', 'clubService', 'registrationApi', 'officerRequestApi', 'userApi', 'sdrConfig', ($scope, tagService, clubService, registrationApi, officerRequestApi, userApi, sdrConfig) ->
    $scope.sdrdata         = {}
    $scope.officerRequest  =
      officers: []
    $scope.removedOfficers = []

    $scope.loading = false

    # true if it's a new registration that doesn't exist on the server
    $scope.isNew = () ->
      not $scope.registration.state or $scope.registration.state in ['New', 'Continuing']

    $scope.registration = registrationApi.get
      registration_id: sdrConfig.registrationId
    , () ->
      $scope.officerRequest = officerRequestApi.get
        officer_request_id: $scope.registration.officer_request_id

    $scope.user = userApi.get()

    getRegIdByOrgId = (oid) ->
      _.findWhere $scope.user.regclubs, {'id': oid}

    $scope.canLoadOldData = () ->
      oid = $scope.registration.organization_id
      if not oid then return false

      regclub = getRegIdByOrgId(oid)
      regclub and !!regclub.registration_id

    $scope.loadOldData = () ->
      if not $scope.canLoadOldData()
        return false

      regclub = getRegIdByOrgId $scope.registration.organization_id, true

      tempReg = registrationApi.get
        registration_id: regclub.registration_id
      , () ->
        tempOffReq = officerRequestApi.get
          officer_request_id: tempReg.officer_request_id
        , () ->
          delete tempReg.registration_id
          delete tempReg.term
          delete tempReg.officer_request_id
          delete tempReg.updated
          delete tempReg.updated_by
          delete tempReg.state_updated
          delete tempReg.state_updated_by
          delete tempReg.state
          delete tempReg.history
          delete tempReg.allowView
          delete tempReg.allowModify
          delete tempReg.allowState
          delete tempReg.$promise
          
          angular.extend $scope.registration, tempReg

          for req in tempOffReq.officers
            delete req.fulfilled

          $scope.officerRequest.officers = tempOffReq.officers

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
      $scope.loading = true
      oldstate = $scope.registration.state

      # Ensure that President and Advisor have Administrator
      for officer in $scope.officerRequest.officers
        officer.admin = 1 if officer.role_id in [34, 53]

      errorHandler = (message) ->
        () ->
          $scope.loading = false
          $scope.registration.state = oldstate
          alert message

      if state == 'Approved'
        $scope.officerRequest.approved = true

      if $scope.isNew()
        $scope.registration.state = state
        $scope.registration.officers = $scope.officerRequest.officers
        $scope.registration.$save {}, () ->
          window.location = $scope.registration.url
        , errorHandler 'Error creating Registration'

      else
        $scope.registration.state = state
        $scope.registration.$update {}, () ->
          $scope.officerRequest.$update {}, () ->
            window.location.reload()
          , errorHandler 'Error saving Officer Request'
        , errorHandler 'Error saving Registration'
  ]
