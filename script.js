
// define header link titles
var titles = {
    "Home"     : "This site's homepage",
    "About Me" : "Get to know me better!",
    "Resume"   : "Download my resume here",
    "Projects" : "Example coding projects"
}

// set hover actions for header elements
var headerList = document.getElementById("header").children;
for (var i = 0; i < headerList.length; i++) {

    // skip list item if no link
    if (headerList[i].children.length == 0)
	continue;
    
    // add action to link
    headerList[i].children[0].onmouseover = function() {
	if (window.location.href == this.href)
	    this.setAttribute("title", "You're already here!");
	else 
	    this.setAttribute("title", titles[this.text]);
    };
}

