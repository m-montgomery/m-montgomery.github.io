
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
