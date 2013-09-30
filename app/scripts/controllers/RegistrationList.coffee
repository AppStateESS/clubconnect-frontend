'use strict'

angular.module('ClubConnectApp')
  .controller 'RegistrationListCtrl', ['$scope', 'registrationApi', ($scope, registrationApi) ->
    $scope.sdrdata = {}

    $scope.sdrdata.registrations = registrationApi.query()

    $scope.regRowClicked = (href) ->
      window.location = href

    $scope.regOrder = (element) ->
      [element.created, element.term, 
        (if element.approved then 'a' else 'b') +
        (if element.presCertified && element.advCertified then 'a' else 'b')]

    getState = (reg, state) ->
      _.findWhere(reg.history, {state: state})

    prettifyDate = (val) ->
      if not val
        val
      else
        val.split(' ')[0]

    $scope.getStateEffective = (reg, state) ->
      d = getState reg, state
      if d then prettifyDate d.effective_date else 'No'

    $scope.getClass = (reg, state) ->
      d = $scope.getStateEffective reg, state
      if d is 'No' then 'warning' else 'success'

    $scope.getWaiting = (reg) ->
      if not getState reg, 'Submitted'
        'Submitter'
      else if not getState reg, 'Approved'
        'CSIL'
      else if not getState reg, 'Certified'

        if getState reg, 'PresCertified'
          'Advisor'
        else if getState reg, 'AdvCertified'
          'President'
        else
          'Pres/Adv'
      else
        ''

    $scope.pr =
      selected: false

    $scope.prettyTerm = (term) ->
      term = "" + term
      year = term[0..3]
      sem  = term[4]

      if sem is "1"
        "Spring, " + year
      else if sem is "2"
        "Summer 1, " + year
      else if sem is "3"
        "Summer 2, " + year
      else if sem is "4"
        "Fall, " + year
      else
        term

  ]
