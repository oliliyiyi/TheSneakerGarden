// Example starter JavaScript for disabling form submissions if there are invalid fields
//(function () {
//  'use strict'
//
//  // Fetch all the forms we want to apply custom Bootstrap validation styles to
//  var forms = document.querySelectorAll('.needs-validation')
//
//  // Loop over them and prevent submission
//  Array.prototype.slice.call(forms)
//    .forEach(function (form) {
//      form.addEventListener('submit', function (event) {
//        if (!form.checkValidity()) {
//          event.preventDefault()
//          event.stopPropagation()
//        }
//
//        form.classList.add('was-validated')
//      }, false)
//    })
//})()
function validateForm() {
    var flag = true;
    var username = document.getElementById("username");
    var fullname = document.getElementById("fullname");
    var phone = document.getElementById("phone");
    var email = document.getElementById("email");
    var address = document.getElementById("address");
    var password = document.getElementById("password");

    const phoneValid = /([(84)+90|(84)+91|090|091])+([0-9]{8})\b/;
    const emailValid = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    const numberValid = /^[0-9]+$/;
    const makhValid = /^KH+[0-9]{5}$/;
    const madvValid = /^DV+[0-9]{3}$/;

    //may
    if (username !== null && username.value === "") {
        document.getElementById("username-err").innerText = "Name is required";
        flag = false;
    } else if (username !== null) {
        document.getElementById("username-err").innerText = "";
    }
    if (fullname !== null && fullname.value === "") {
        document.getElementById("fullname-err").innerText = "FullName is required";
        flag = false;
    } else if (fullname !== null) {
        document.getElementById("fullname-err").innerText = "";
    }
    if (phone !== null && (phone.value === "" || !phoneValid.test(phone.value))) {
        document.getElementById("phone-err").innerText = "Phone is required";
        flag = false;
    } else if (phone !== null) {
        document.getElementById("phone-err").innerText = "";
    }
    if (email !== null && (email.value === "" || !emailValid.test(email.value))) {
        document.getElementById("email-err").innerText = "Email is invalid";
        flag = false;
    } else if (email !== null) {
        document.getElementById("email-err").innerText = "";
    }
    if (address !== null && address.value === "") {
        document.getElementById("address-err").innerText = "Address is required";
        flag = false;
    } else if (address !== null) {
        document.getElementById("address-err").innerText = "";
    }
    if (password !== null && password.value === "") {
        document.getElementById("password-err").innerText = "Password is required";
        flag = false;
    } else if (password !== null) {
        document.getElementById("password-err").innerText = "";
    }
    
    return flag;
}