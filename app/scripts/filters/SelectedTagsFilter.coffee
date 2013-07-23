'use strict';

angular.module('ClubConnectApp')
  .filter 'SelectedTagsFilter', () ->
    (input, tags) ->

      console.log(input)

      # Get array of tags that are selected
      selTags = _.pluck(_.filter(tags, (tag) -> tag.selected), 'title')

      # If no tags are selected, let everything through
      return input if not selTags.length

      # Otherwise, if the intersection of input.*.tags and selTags has anything, it's a match
      _.filter(input, (item) ->
        !!_.intersection(item.tags, selTags).length
      )
