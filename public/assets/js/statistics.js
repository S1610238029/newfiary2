/**
 * Created by Natascha on 26.11.2018.
 */

/**
 * Trying to do graph stuff here
 */
var data = [{
    y: "60",
    x: "1" },
    {
        y: "80",
        x: "2" },
    {
        y: "61",
        x: "3" },
    {
        y: "90",
        x: "4" },
    {
        y: "50",
        x: "5" },
    {
        y: "70",
        x: "6" },
    {
        y: "90",
        x: "7" },
    {
        y: "70",
        x: "8" }];




var svg = d3.select('#visualisation');
var WIDTH = 600;
var HEIGHT = 100;
var MARGINS = {
    top: 0,
    right: 0,
    bottom: 0,
    left: 0 };


var xScale = d3.scale.linear().
range([MARGINS.left, WIDTH - MARGINS.right]).
domain([1, 12]);

var yScale = d3.scale.linear().
range([HEIGHT - MARGINS.top, MARGINS.bottom]).
domain([0, 150]);

var xAxis = d3.svg.axis().
scale(xScale).
orient("bottom");

var yAxis = d3.svg.axis().
scale(yScale).
orient("left");



var lineGen = d3.svg.line().
x(function (data) {
    return xScale(data.x);
}).
y(function (data) {
    return yScale(data.y);
});

var path = svg.append('svg:path').
attr('d', lineGen(data)).
attr('stroke', 'gray').
attr('stroke-width', 1).
attr('fill', 'none');

var totalLength = path.node().getTotalLength();

path.
attr("stroke-dasharray", totalLength + " " + totalLength).
attr("stroke-dashoffset", totalLength).
transition().
duration(1500).
ease("ease-in-out-quad").
attr("stroke-dashoffset", 0);


