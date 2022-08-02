"use strict";
$(document).ready(function () {
    // Accordion
    var all_panels = $(".templatemo-accordion > li > ul").hide();

    $(".templatemo-accordion > li > a").click(function () {
        console.log("Hello world!");
        var target = $(this).next();
        if (!target.hasClass("active")) {
            all_panels.removeClass("active").slideUp();
            target.addClass("active").slideDown();
        }
        return false;
    });
    // End accordion

    // Product detail
    $(".product-links-wap a").click(function () {
        var this_src = $(this).children("img").attr("src");
        $("#product-detail").attr("src", this_src);
        return false;
    });
    $("#btn-minus").click(function () {
        var val = $("#var-value").html();
        val = val == "1" ? val : val - 1;
        $("#var-value").html(val);
        $("#product-quanity").val(val);
        return false;
    });
    $("#btn-plus").click(function () {
        var val = $("#var-value").html();
        val++;
        $("#var-value").html(val);
        $("#product-quanity").val(val);
        return false;
    });
    $(".btn-size").click(function () {
        var this_val = $(this).html();
        $("#product-size").val(this_val);
        $(".btn-size").removeClass("btn-secondary");
        $(".btn-size").addClass("btn-warning");
        $(this).removeClass("btn-warning");
        $(this).addClass("btn-secondary");
        return false;
    });
    // End roduct detail

    $(".size-button").click(function (e) {
        e.preventDefault;
        const size = $(this);
        if ($('.size-button.active').length > 0)
        {
            $('.size-button.active').removeClass("active");
        }
        size.addClass("active");
        $('#size').val(size.val());
        let text = size.attr('stock');
        if(text == 0){
            $('.product-availble').text("Out of stock");
            $('.product-availble').css('color','red');
            $('.btn-add-to-cart').prop("disabled",true);
            
        } else {
            $('.product-availble').text("In stock: " + text);
            $('.product-availble').css('color','black');
            $('.btn-add-to-cart').removeAttr("disabled");
        }
        
    });
});

function validateAddToCart() {
    var flag = true;

    const elWithClassExists = document.querySelectorAll('.size-button').length > 0;

    if (elWithClassExists) {
        var size = document.getElementById("size");
        if (size !== null && size.value === "") {
            document.getElementById("size-err").innerText = "Size is required";
            $(".size-box").addClass("invalid-border");
            flag = false;
        } else if (size !== null) {
            document.getElementById("size-err").innerText = "";
            $(".size-box").removeClass("invalid-border");
        }
    }

    return flag;
}
