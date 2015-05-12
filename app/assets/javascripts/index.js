$(document).ready(function() {
  var constant = 0;
  var first = true;
  // var gender_check = function() {
  //   if(first !== true) {
  //     if (constant === 1) {
  //       $('.Female').hide();
  //     } else if(constant === 0) {
  //       $('.Male').hide();
  //     };
  //   };
  // };

  var gender_menu_check = function() {
    var item = "";
    $("#gender_menu option:selected").each(function() {
      item = $(this).text();
    });
    if(item === "Male") {
      $('.Female').hide();
    } else if(item === 'Female') {
      $('.Male').hide();
    };
  };

  var fitness_check = function() {
    var item = "";
    $("#fitness_level option:selected").each(function() {
      item = $(this).text();
    });
    if(item === "Beginner") {
      $('.Intermidate').hide();
      $('.Advanced').hide();
    } else if(item === 'Intermidate') {
      $('.Beginner').hide();
      $('.Advanced').hide();
    } else if(item === 'Advanced') {
      $('.Beginner').hide();
      $('.Intermidate').hide();
    };
  };

  var gym_check = function() {
    var item = "";
    $("#gym option:selected").each(function() {
      item = $(this).text();
    });
    if(item === "Virgin Active") {
      $('.Fitness').hide();
    } else if(item === 'Fitness Freaks') {
      $('.Active').hide();
    };
  };

  $("#gym").change(function() {
    var item = "";
    $("#gym option:selected").each(function() {
      item = $(this).text();
    });
    if(item === "Virgin Active") {
      $('.Active').show();
      $('.Fitness').hide();
    } else if(item === 'Fitness Freaks') {
      $('.Active').hide();
      $('.Fitness').show();
    } else {
      $('.Active').show();
      $('.Fitness').show();
    };
    gender_menu_check();
    fitness_check();
  });

  $("#gender_menu").change(function () {
    var item = "";
    $("#gender_menu option:selected").each(function() {
      item = $(this).text();
    });
    if(item === "Male") {
      $('.Female').hide();
      $('.Male').show();
    } else if(item === 'Female') {
      $('.Female').show();
      $('.Male').hide();
    } else if(item === 'All') {
      $('.Female').show();
      $('.Male').show();
    };
    fitness_check();
    gym_check();
  });

  // $("#gender").click(function() {
  //   if(constant === 0) {
  //     $('.Female').hide();
  //     $('.Male').show();
  //     constant = 1;
  //     $("#gender").text('Male')
  //   } else if(constant === 1) {
  //     $('.Male').hide();
  //     $('.Female').show();
  //     constant = 0;
  //     $("#gender").text('Female')
  //   };
  //   fitness_check();
  //   gym_check();
  //   first = false;
  // });

  $("#fitness_level").change(function () {
    var item = "";
    $("#fitness_level option:selected").each(function() {
      item = $(this).text();
    });
    if(item === "Beginner") {
      $('.Beginner').show();
      $('.Intermidate').hide();
      $('.Advanced').hide();
    } else if(item === 'Intermidate') {
      $('.Beginner').hide();
      $('.Intermidate').show();
      $('.Advanced').hide();
    } else if(item === 'Advanced') {
      $('.Beginner').hide();
      $('.Intermidate').hide();
      $('.Advanced').show();
    } else {
      $('.Beginner').show();
      $('.Intermidate').show();
      $('.Advanced').show();
    };
    gender_menu_check();
    gym_check();
  });
});