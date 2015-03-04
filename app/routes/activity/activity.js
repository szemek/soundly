angular.module('soundly.routes.activity', [
  'soundly.api.soundly'
])
.controller('AllActivityController', ['$scope', '$http', '$sce', 'SoundlyApi', function($scope, $http, $sce, SoundlyApi){
  SoundlyApi.allActivity().success(function(data){
    $scope.svg = $sce.trustAsHtml(data);
  });
}])
.controller('RecentActivityController', ['$scope', '$http', 'SoundlyApi', function($scope, $http, SoundlyApi){
  var draw = function(data){
    var width = 800,
      height = 150;

    var y = d3.scale.linear()
      .range([height, 0]);


    var chart = d3.select(".chart")
      .attr("width", width)
      .attr("height", height + 50);

    y.domain([0, d3.max(data, function(d) { return d; })]);

    var barWidth = width / data.length;

    var bar = chart.selectAll("g")
      .data(data)
      .enter().append("g")
      .attr("transform", function(d, i) { return "translate(" + i * barWidth + ", 50)"; });

    bar.append("rect")
      .attr("y", function(d) { return y(d); })
      .attr("height", function(d) { return height - y(d); })
      .attr("width", barWidth - 1);

    bar.append("text")
      .attr("x", barWidth / 2)
      .attr("y", function(d) { return y(d) - 11; })
      .attr("dy", ".75em")
      .text(function(d) { return d; });
  };

  SoundlyApi.recentActivity().success(function(data){
    draw(data);
  });
}]);
