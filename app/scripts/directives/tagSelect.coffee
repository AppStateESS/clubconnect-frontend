'use strict';

angular.module('ClubConnectApp')
  .directive 'tagSelect', () ->
    scope:
      tags: '='
      cols: '@'
      radio: '='
    templateUrl: 'views/directives/tagSelect.html'
    controller: ['$scope', '$attrs', ($scope, $attrs) ->

      """
        Watch scope.tags for changes.  The tagset needs to be split into columns
        if scope.cols is set.
      """
      $scope.$watch 'tags', (input) ->
        if not input
          return undefined

        idx = 0
        len = input.length

        # If the client specified cols, use that, otherwise 1 column
        if not $scope.cols or $scope.cols < 1 then numchunks = 1 else numchunks = $scope.cols

        # How many items per cell - total scope.tags length divided by number of columns
        ct = Math.ceil(len/numchunks)

        # Create chunks, put array of arrays of tags on scope
        chunked = []
        while idx < len
          lastidx = idx
          idx += ct
          chunked.push input[lastidx..idx-1]
        
        $scope.chunkedTags = chunked
        undefined

      """
        Watch scope.radio for changes.  Adjust behavior of the widget between
        single- and multi-select.
      """
      $scope.$watch $attrs.radio, (radio) ->

        # If single-select and anything is selected, take the most recent selection and make
        # it the only one
        if radio and $scope.lastSelected
          for scopeTag in $scope.tags
            scopeTag.selected = scopeTag.name == $scope.lastSelected.name and $scope.lastSelected.selected
        undefined

      $scope.tagClicked = (tag) ->

        # Save the most recently selected tag in case mode changes to single-select in the future
        $scope.lastSelected = tag

        if $scope.radio

          # If single-select, set all other tags to unselected
          for scopeTag in $scope.tags
            scopeTag.selected = scopeTag.name == tag.name and !tag.selected

        else

          # If multi-select, just flip the bit
          tag.selected = !tag.selected
        undefined

      undefined
    ]
