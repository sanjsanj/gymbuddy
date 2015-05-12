$(document).ready(function() {
  var constant = 0;
  var first = true;
  var gender_check = function() {
    if(first !== true) {
      if (constant === 1) {
        $('.Female').hide();
      } else if(constant === 0) {
        $('.Male').hide();
      };
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
    };
    gender_check();
    fitness_check();
  });

  $("#gender").click(function() {
    if(constant === 0) {
      $('.Female').hide();
      $('.Male').show();
      constant = 1;
      $("#gender").text('Male')
    } else if(constant === 1) {
      $('.Male').hide();
      $('.Female').show();
      constant = 0;
      $("#gender").text('Female')
    };
    fitness_check();
    gym_check();
    first = false;
  });

  $("#reset").click(function() {
    $('.Male').show();
    $('.Female').show();
  });

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
    };
    gender_check();
    gym_check();
  });
});