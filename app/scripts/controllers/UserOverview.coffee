'use strict'

angular.module('ClubConnectApp')
  .controller 'UserOverviewCtrl', ['$scope', '$sce', ($scope, $sce) ->
    $scope.user = 
      notifications: [
        title: 'Club Registration'
        text:   $sce.trustAsHtml 'Confirm your involvement in <strong>Appalachian Linux Users Group</strong> to proceed.'
        url:   'derp'
      ,
        title: 'Membership Request'
        text:   $sce.trustAsHtml '<strong>Testy Q. Testapp</strong> has requested membership in <strong>Higher Ground</strong>.'
        url:   'derp'
      ,
        title: 'Membership Request'
        text:   $sce.trustAsHtml 'You have been asked to join <strong>Appalachian Nerd Network</strong>.'
        url:   'derp'
      ,
        title: 'Review Co-Curricular Transcript'
        text:   $sce.trustAsHtml 'You haven\'t looked at your transcript in awhile!'
        url:   'derp'
      ]
  ]
