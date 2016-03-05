// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require bootstrap-sprockets
//= require typeahead
//= require select2
//= require_tree .

var substringMatcher = function(strs){
	return function findMatches(q,cb){
		var matches,substringRegex;
		
		matches = [];
		substrRegex = new RegExp(q,'i');
		
		$.each(strs,function(i,str){
			if(substrRegex.test(str)){
				matches.push(str);
			}
		});
		
		cb(matches);
	};
};

var states = ['New Delhi','UP','MP'];

$('#the-basics .typeahead').typeahead({
	hint: true,
	highlight: true,
	minLength: 1
},
{
	name: 'states',
	source: substringMatcher(states)
});
