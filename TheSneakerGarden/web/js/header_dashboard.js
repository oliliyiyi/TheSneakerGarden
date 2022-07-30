//
//if (window.location.href.toString().endsWith("/dashboard.jsp") || window.location.href.toString().endsWith("/")) {
//    let home = document.getElementById("dashboard");
//    home.className = "active"
//}
//if (window.location.href.toString().endsWith("/user-management.jsp")) {
//    let home = document.getElementById("user-management");
//    home.className = "active"
//}
//
//if (window.location.href.toString().endsWith("/item-management.jsp")) {
//    let home = document.getElementById("item-management");
//    home.className = "active"
//}
//
//if (window.location.href.toString().endsWith("/order-management.jsp")) {
//    let home = document.getElementById("order-management");
//    home.className = "active"
//}
//
//if (window.location.href.toString().endsWith("inventory-management.jsp")) {
//    let home = document.getElementById("inventory-management");
//    home.className = "active"
//}
var myParam = window.location.pathname.substring(18);
let id = null;
if (myParam === "homeAdmin") {
    id = "dashboard";
} else if (myParam === "admin-management" || myParam === "user-management") {
    id = "user";
} else if (myParam === "item-management") {
    id = "item-management";
} else if (myParam === "order-management") {
    id = "order-management";
}
$('.sidebar-menu #' + id).click(function (e) {
    e.preventDefault();
});
function activeSidebar() {
    $('.sidebar-menu #' + id).addClass("active");
}
;

activeSidebar();