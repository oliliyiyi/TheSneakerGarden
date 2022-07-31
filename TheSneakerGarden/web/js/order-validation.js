/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateOrderForm() {
    var flag = true;
    var orderdate = document.getElementById("orderdate").value;
    var shipdate = document.getElementById("shipdate").value;
    var tmpOrderDate = new Date(orderdate).toISOString();
    var tmpShipDate = new Date(shipdate).toISOString();
    
    
    //may
    if (tmpShipDate < tmpOrderDate) {
        document.getElementById("shipdate-err").innerText = "Ship Date can't be below Order Date";
        flag = false;
    } else if (tmpShipDate !== null) {
        document.getElementById("shipdate-err").innerText = "";
    }
   
    return flag;
}

