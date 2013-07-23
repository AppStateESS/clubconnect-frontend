'use strict';

angular.module('ClubConnectApp')
  .directive('clubDirectory', () ->
    scope:
      clubs: "=clubs"
    template: '<ul class="nav nav-tabs nav-stacked"><li ng-repeat="club in clubs"><a href="javascript:void(0)">{{club.fullname}} <span ng-show="club.electionTag" class="label label-success">{{club.electionTag}}</span> <span ng-repeat="tag in club.tags" class="label">{{tag}}</span></a></li></ul>'
  )
