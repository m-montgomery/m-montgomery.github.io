
// define header link titles
var titles = {
    "home"     : "This site's homepage",
    "about"    : "Get to know me better!",
    "resume"   : "Download my resume here",
    "projects" : "See example coding projects"
}

// set hover actions for header elements
var headerList = document.getElementsByClassName("header-text");
for (var i = 0; i < headerList.length; i++) {
    
    // add action to link
    headerList[i].onmouseover = function() {
	if (window.location.href == this.href)
	    this.setAttribute("title", "You're already here!");
	else 
	    this.setAttribute("title", titles[this.id]);
    };
}
