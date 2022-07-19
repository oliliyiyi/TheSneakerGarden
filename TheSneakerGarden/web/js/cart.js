$(document).ready(function () {
    let myCart = document.getElementById("myCart");
    let cartItem = document.getElementsByClassName("cartItem");
    let emptyCart = document.getElementById("emptyCart");

    const checkEmptyCart = (e) => {
        if (cartItem.length <= 0) {
            emptyCart.style.visibility = "visible";
            emptyCart.style.setProperty("background-color", "#eee", "important");
            myCart.remove();
        } else {
            emptyCart.style.visibility = "hidden";
        }
    };

    const deleteItem = (e) => {
        e.parentNode.parentNode.parentNode.parentNode.parentNode.remove();
        checkEmptyCart(e);
    };

    const onMinusProduct = (e) => {
        e.parentNode.querySelector("input[type=number]").stepDown();
        let value = e.parentNode.querySelector("input[type=number]").value;
        if (value <= 0) {
            e.parentNode.parentNode.parentNode.parentNode.remove();
        }
        checkEmptyCart(e);
    };
    var listItem = $('.my-account-item div');

    listItem.click(function () {
        if ($(this).attr('id') !== 1) {
            listItem.removeAttr('id').removeClass('active');
            $(this).addClass('active');
            $(this).attr('id', 1);
        }
        if ($(this).attr('tab') == 2){
            $('.card-profile-2').removeClass('d-none');
            $('.card-profile-1').addClass('d-none');
            $('.card-profile-3').addClass('d-none');
        }
        if ($(this).attr('tab') == 3){
            $('.card-profile-2').addClass('d-none');
            $('.card-profile-1').addClass('d-none');
            $('.card-profile-3').removeClass('d-none');
        }
        if ($(this).attr('tab') == 1){
            $('.card-profile-2').addClass('d-none');
            $('.card-profile-1').removeClass('d-none');
            $('.card-profile-3').addClass('d-none');
        }
    });
    
})