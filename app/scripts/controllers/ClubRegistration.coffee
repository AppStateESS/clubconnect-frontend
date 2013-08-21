'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubRegistrationCtrl', ['$scope', 'tagService', 'clubService', 'ckeditorCss', ($scope, tagService, clubService, ckeditorCss) ->
    $scope.sdrdata      = {}
    $scope.sdrapi       = {}
    blankRegistration   = {officers: [], searchtags: [], elections: []}
    $scope.registration = blankRegistration

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

    $scope.ckeditorCss = ckeditorCss
            
    clubService.getAllClubs()
      .then (clubs) ->
        $scope.sdrdata.clubs = clubs

    $scope.sdrapi.getRegistration = clubService.getRegistration

    $scope.sdrapi.submitReg = () ->
      $scope.regstate.triedSubmit = true

      about     = $scope.validate.about()
      category  = $scope.validate.category()
      people    = $scope.validate.people()
      elections = $scope.validate.elections()

      errors   = _.union about.errors,   category.errors,   people.errors,   elections.errors
      warnings = _.union about.warnings, category.warnings, people.warnings, elections.warnings

      if errors.length
        message = 'There were errors in the form.  Please fix the following problems and try again:\n\n'
        for error in errors
          message = message + error + '\n'

        alert(message)
      else
        if warnings.length
          message = 'Hang on a second!  You filled in all of the required information, but you may want to check on these fields before submitting:\n\n'
          for warning in warnings
            message = message + warning + '\n'
          message = message + '\nClick OK to submit the form anyway, or Cancel to edit the form.'
          if confirm(message)
            clubService.submitReg($scope.registration).then () -> $scope.regstate.done = true
        else
          clubService.submitReg($scope.registration).then () -> $scope.regstate.done = true

    $scope.validate =

      about: () ->
        errors   = []
        warnings = []

        if not $scope.registration.fullname
          errors.push 'Please specify the full name of your organization.'

        if not $scope.registration.shortname
          warnings.push 'You did not specify a short name.  This will be used for searching for clubs on the Club Directory and directly linking to club profiles, such as on printed materials.  If your organization has a well-known acronym, it should be in this field.'

        if not $scope.registration.address
          errors.push 'Please specify an address for your organization.'

        if $scope.registration.ein and not $scope.registration.bank
          errors.push 'You specified an EIN.  Please also specify which bank services your organization\'s accounts.'

        if $scope.registration.bank and not $scope.registration.ein and not $scope.regstate.ein
          errors.push 'You specified that your organization has a bank account.  Please provide your Employer Identification Number.'

        {errors: errors, warnings: warnings}

      category: () ->
        errors   = []
        warnings = []

        if not $scope.registration.sgaelection
          errors.push 'Please pick an SGA Election category.'

        if not $scope.registration.searchtags
          errors.push 'Please pick one or more categories to describe your organization.'

        {errors: errors, warnings: warnings}

      profile: () ->
        errors   = []
        warnings = []

        if not $scope.registration.purpose
          errors.push 'Please enter the "Purpose" from your organization\'s constitution into the Purpose field.'

        if not $scope.registration.description
          warnings.push 'Please consider saying a few words about your organization in the description field of the public profile.'

        if not $scope.registration.requirements
          warnings.push 'If your organization has any membership requirements such as dues, service hours, mandatory events, etc, please list them in the requirements section of the public profile.'

        if not $scope.registration.meetings
          errors.push 'Please provide a meeting schedule (for example, "Every First and Third Thursday at 7pm") for your organization\'s public profile.'

        if not $scope.registration.location
          errors.push 'Please provide a meeting location for your organization\'s public profile.  If the location changes, provide some information on how to find out where meetings will be held.'

        if not $scope.registration.requirements
          warnings.push 'If you specify a website on the public profile section, there will be a direct link to it right off of the club directory.'

        {errors: errors, warnings: warnings}

      people: () ->
        errors   = []
        warnings = []

        advisor   = false
        president = false

        for person in $scope.registration.officers
          if person.email.indexOf('@appstate.edu') == -1
            errors.push 'Please only use AppState email addresses.'
          if person.position == 53
            advisor = true
          if person.position == 34
            president = true

        if !advisor and president
          errors.push 'Please specify an advisor for this organization.'
        else if !advisor and !president
          errors.push 'Please specify an advisor and a president for this organization.'
        else if advisor and !president
          errors.push 'Please specify a president for this organization.'

        {errors: errors, warnings: warnings}

      elections: () ->
        errors   = []
        warnings = []

        if !$scope.registration.elections.length
          errors.push 'Please pick at least one election month.'

        {errors: errors, warnings: warnings}

    $scope.regstate =
      history: false
      done: false

    $scope.setHistory = (parent) ->
      if !parent
        $scope.registration.parent = 0
        $scope.regstate.history = true
        $scope.registration = blankRegistration
        return undefined

      $scope.registration.parent = if parent then parent.id else 0
      $scope.regstate.history = true
      $scope.regstate.ein = !!parent.ein

      # Load the data graciously sent us from the server
      $scope.registration.fullname    = parent.fullname
      $scope.registration.shortname   = parent.shortname
      $scope.registration.address     = parent.address
      $scope.registration.bank        = parent.bank

      # TODO: Election Tags, Search Tags

      $scope.registration.purpose     = parent.purpose
      $scope.registration.description = parent.description
      $scope.registration.meetings    = parent.meetings
      $scope.registration.location    = parent.location
      $scope.registration.website     = parent.website

      $scope.registration.elections   = parent.elections

      $scope.registration.officers    = parent.officers

      undefined

    $scope.clearHistory = () ->
      $scope.registration.parent = undefined
      $scope.regstate.history = false

    $scope.newperson = {}

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
