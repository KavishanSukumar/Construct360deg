const upload = document.querySelector("input");
const uploadbtn = document.querySelector(".upload");
const image = document.querySelector(".productimg img");
const close = document.querySelector(".row11 .close");

var loadFile = function(event){
    var image = document.querySelector(".productimg img");
    image.classList.add("active");
    close.classList.add("exit");
    image.src = URL.createObjectURL(event.target.files[0]);


    close.onclick = (e) => {
        image.classList.remove("active");
        close.classList.remove("exit");
    }
}