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
      var current_dept = $(event.target).parent()
      //location.reload();
      current_dept.parent().find('li.active').removeClass('active');
      current_dept.addClass('active');
      $scope.department = $(event.target).text();
      toggleCourses();
      var dept_id = angular.element('.ng-scope .active .ng-binding').attr('dept_id');
      //$http.get('/dept_data?dept_id=' + dept_id);
    }

  $http.get('/curr_course_data').success(function(data) {
    $scope.list1 = data;
  });
  $scope.list2 = [];
  $scope.list3 = [];
  $scope.list4 = [];
  $http.get('/rec_course_data').success(function(data) {
    $scope.list5 = data;
  });

  // $http.get('/dept_grade_courses_data?dept=' + $scope.department).success(function(data) {
  //     $scope.dept_grade_courses = data;
  //   });
  
//  $http(
//    {
//      method: 'GET'
//      url: '/dept_grade_courses_data'
//      params: {dept: $scope.department}
//    }
//  ).success(function(data) {
//    $scope.dept_grade_courses = data;
//  });
   
  $scope.myCallback = function(){
    console.log(this);
    console.log($(this));
    console.log($this);
    console.log($(this.data));
    console.log($('.selected_courses .selected_course'));
    console.log($scope.department);
    $http(
        {
          url: '/store_course',
          method: 'GET',
          params: {id: 'id'}
        }
      );
    // var s = angular.element('.selected_courses .selected_course'); //$('.selected_courses .selected_course');
    // for(var i = 0; i < s.length; i++) { 
    //   var obj = s[i]
    //   var val = obj.value
    //   console.log(obj); 
    //   console.log(val); 
    //   // console.log($(event.target));
    //   $http(
    //     {
    //       url: '/store_course',
    //       method: 'GET',
    //       params: {id: val}
    //     }
    //   );
    // }
    console.log('Dropped into something');
  };

  // Limit items to be dropped in list1
  $scope.optionsList1 = {
    accept: function(dragEl) {
      if ($scope.list1.length > $scope.list5.length) {
        return false;
      } else {
        return true;
      }
    }
  };

  }
]);
