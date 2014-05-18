student.controller('StudentCtrl', [
  '$scope', '$location', '$http', function($scope, $location, $http) {
    $scope.students = [];
    $http.get('/stud_data').success(function(data) {
      $scope.students = data;
    });
    $scope.list1 = {title: 'AngularJS - Drag Me'};
    $scope.list2 = {};


  $scope.list1 = [];
  $scope.list2 = [];
  $scope.list3 = [];
  $scope.list4 = [];
  
  $scope.list5 = [
    { 'title': 'English', 'drag': true },
    { 'title': 'Science', 'drag': true },
    { 'title': 'Math', 'drag': true },
    { 'title': 'Physics', 'drag': true },
    { 'title': 'History', 'drag': true },
  ];

  // Limit items to be dropped in list1
  $scope.optionsList1 = {
    accept: function(dragEl) {
      if ($scope.list1.length >= 4) {
        return false;
      } else {
        return true;
      }
    }
  };

  //  $scope.list1 = [{'title': 'Lolcat Shirt'},{'title': 'Cheezeburger Shirt'},{'title': 'Buckit Shirt'}];
  // $scope.list2 = [{'title': 'Zebra Striped'},{'title': 'Black Leather'},{'title': 'Alligator Leather'}];
  // $scope.list3 = [{'title': 'iPhone'},{'title': 'iPod'},{'title': 'iPad'}];

  // $scope.list4 = [];

  // $scope.hideMe = function() {
  //   return $scope.list4.length > 0;
  // }
  }
]);