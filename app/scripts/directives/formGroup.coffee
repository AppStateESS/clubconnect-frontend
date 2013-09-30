'use strict';

angular.module('ClubConnectApp')
  .directive 'formGroup', ->
    restrict: 'C'
    link: (scope, element, attrs) ->
      form = $(element.parents('form')[0]).attr 'name'

      if not form
        return

      isButton = ($input) ->
        $input.attr('type') is 'submit' or $input.attr('type') is 'button' or $input.is 'button'

      reJiggerClass = () ->
        element.removeClass 'has-error'
        for el in element.find 'input,textarea,select'
          $input = $(el)
          # Skip buttons because we don't care
          if isButton $input
            continue

          name = $input.attr 'name'
          inputScope = scope[form][name]

          if inputScope.$erroneous
            element.addClass 'has-error'

        undefined

      setupBlur = ($input) ->
        if isButton $input
          return
        name = $input.attr 'name'
        inputScope = scope[form][name]
        inputScopeInvalidExpr = form + '.' + name + '.$invalid'
        inputScopeErroneousExpr = form + '.' + name + '.$erroneous'

        # We don't want to bug the user until they have left the field
        $input.blur () ->
          scope.$apply () ->
            if inputScope.$invalid
              inputScope.$erroneous = true
            else
              inputScope.$erroneous = false

        # But, if they fix the error while typing, we can reflect that immediately
        scope.$watch inputScopeInvalidExpr, (invalid) ->
          if not invalid
            inputScope.$erroneous = false

        scope.$watch inputScopeErroneousExpr, (erroneous) ->
          reJiggerClass()

        undefined


      for el in element.find 'input,textarea,select'
        setupBlur $(el)

      undefined
