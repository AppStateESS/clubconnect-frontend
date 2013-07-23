'use strict';

angular.module('ClubConnectApp')
  .directive('clubDirectory', () ->
    scope:
      clubs: "=clubs"
      tags: "=tags"
      search: "=search"
    template: '<ul class="nav nav-tabs nav-stacked"><li ng-repeat="club in clubs | SelectedTagsFilter:tags | filter:search"><a href="javascript:void(0)">{{club.fullname}} <span ng-repeat="tag in club.tags" ng-class="{{ tag == club.electionTag && \'label-success\' || \'\' }}" class="label">{{tag}}</span></a></li></ul>'
  )
