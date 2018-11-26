function closeNav(){

    var sidebar = document.getElementById("sidebar").classList.toggle("active");
    document.getElementById("placeholder").classList.toggle("active");
    document.getElementById("arrow").classList.toggle("active");
    console.log("toggle");

    if (sidebar.hasClass("active")){

    }


    let element = document.getElementById("sidebar");
    element.addEventListener("transitionend", function(event) {

    }, false);
}

