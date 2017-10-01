var fill = d3.scale.category20b();

var w = window.innerWidth
var h = window.innerHeight;

var max, fontSize;

var layout = d3.layout.cloud().timeInterval(Infinity).size([ w, h ]).fontSize(
		function(d) {
			return fontSize(+d.value);
		}).text(function(d) {
	return d.key;
}).on("end", draw);
/*layout = d3.layout.cloud().timeInterval(10).size([ w, h ]).fontSize(
		function(t) {
			return fontSize(+t.value)
		}).text(function(t) {
	return t.key
}).on("word", progress).on("end", draw)*/

var svg;

var vis;
/*update(tags);

window.onresize = function(event) {
	update(tags);
};*/

function draw(data, bounds) {
	/*var w = window.innerWidth, h = window.innerHeight;
	 w = parseInt(0.5 * window.innerWidth);
     h = parseInt(0.3 * window.innerHeight);*/
	svg.attr("width", w).attr("height", h);

	scale = bounds ? Math.min(w / Math.abs(bounds[1].x - w / 2), w
			/ Math.abs(bounds[0].x - w / 2), h / Math.abs(bounds[1].y - h / 2),
			h / Math.abs(bounds[0].y - h / 2)) / 2 : 1;

	var text = vis.selectAll("text").data(data, function(d) {
		return d.text.toLowerCase();
	});
	text.transition().duration(1000).attr("transform", function(d) {
		return "translate(" + [ d.x, d.y ] + ")rotate(" + d.rotate + ")";
	}).style("font-size", function(d) {
		return d.size + "px";
	});
	text.enter().append("text").attr("text-anchor", "middle").attr(
			"transform",
			function(d) {
				return "translate(" + [ d.x, d.y ] + ")rotate(" + d.rotate
						+ ")";
			}).style("font-size", function(d) {
		return d.size + "px";
	}).style("opacity", 1e-6).transition().duration(1000).style("opacity", 1);
	text.style("font-family", function(d) {
		return d.font;
	}).style("fill", function(d) {
		if(d.opinion == "inc")
			return "rgb(255, 0, 0)";
		else if(d.opinion == "dec")
			return  "rgb(0, 0, 225)";
		else if(d.opinion == "neu")
			return "rgb(0, 225, 0)";
		else
			return "rgb(225, 225, 225)";
	}).text(function(d) {
		return d.text;
	});

	vis.transition().attr("transform",
			"translate(" + [ w >> 1, h >> 1 ] + ")scale(" + scale + ")");
}

function drawCloud(tags, divId) {
	if(tags.length ==0)
		return;
	w = parseInt(0.4 * window.innerWidth);
	h = parseInt(0.4 * window.innerHeight);
	//document.getElementById("vis").style.width = w;
	//document.getElementById("vis").style.height = h;
	//document.getElementById("vis").firstChild.width.baseVal.value = w;
	//document.getElementById("vis").firstChild.height.baseVal.value = h;
	//layout = d3.layout.cloud().timeInterval(10).size([w, h]).fontSize(function(t) { return fontSize(+t.value) }).text(function(t) { return t.key }).on("word", progress).on("end", draw)

	svg = d3.select(divId).append("svg").attr("width", w).attr("height", h);
	vis = svg.append("g").attr("transform","translate(" + [ w >> 1, h >> 1 ] + ")");
	layout = d3.layout.cloud().timeInterval(Infinity).size([ w, h ]).fontSize(
			function(d) {
				return fontSize(+d.value);
			}).text(function(d) {
		return d.key;
	}).on("end", draw);
	layout.font('impact').spiral('archimedean');
	fontSize = d3.scale['sqrt']().range([ 10, 50 ]);
	if (tags.length) {
		fontSize.domain([ +tags[tags.length - 1].value || 1, +tags[0].value ]);
	}
	layout.stop().words(tags).start();
}



