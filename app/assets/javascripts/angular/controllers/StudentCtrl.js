student.controller('StudentCtrl', [
  '$scope', '$location', '$http', function($scope, $location, $http) {
    $scope.students = [];
    $scope.active  = '';
    $http.get('/stud_data').success(function(data) {
      $scope.students = data;
    });
    $scope.list1 = {title: 'AngularJS - Drag Me'};
    $scope.list2 = {};

    $http.get('/dept_data').success(function(data) {
      $scope.depts = data;
      $scope.department  = data[0]['name'];
    
    });

    $scope.active_class = function(event) {
      $(event.target).parent().parent().find('li.active').removeClass('active');
      $(event.target).parent().addClass('active');
      $scope.department = $(event.target).text();
    }

  $scope.list1 = [];
  $scope.list2 = [];
  $scope.list3 = [];
  $scope.list4 = [];
  //$http.get('/rec_course_data').success(function(data) {
    $scope.list5 = 
    [
      { 'title': 'Englishes', 'drag': true },
      { 'title': 'Science', 'drag': true },
      { 'title': 'Math', 'drag': true },
      { 'title': 'Physics', 'drag': true },
      { 'title': 'History', 'drag': true },
    ];
    
//     i = 0;
//     {
//     while(i < data.length){
//       { 'title': i['name'], 'drag': true}
// i++;
//     }
//   };
  //});
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

  }
]);
