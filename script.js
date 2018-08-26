
// define header link titles
var titles = {
    "home"     : "This site's homepage",
    "about"    : "Get to know me better!",
    "resume"   : "Download my resume here",
    "projects" : "Example coding projects"
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

// set up photo slideshow
var photoIndex = 0;
var photos = document.getElementsByClassName("slideshow");
function slideshow () {

    // hide previous photo and update index
    photos[photoIndex].style.display = "none";
    photoIndex = (photoIndex + 1) % photos.length;

    // show next photo
    photos[photoIndex].style.display = "inline";

    // pause to display photo
    setTimeout(slideshow, 5000);

}
slideshow();
