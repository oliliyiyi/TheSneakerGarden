<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% DecimalFormat formatter = new DecimalFormat("###,###,###");%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="./../../components/head.jsp" %>
        <title>The Sneaker Garden</title>
        <!-- Link To CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>
        <%@include file="./../../components/header.jsp" %>
        <div class="introduction ">
            <div class="row">
                <div class="col-md-6">
                    <img style="display:block" src="https://i.giphy.com/media/3o6Ztqh4JSlVqi2Z20/giphy.webp">
                </div>               
                <div class="col-md-6">
                    <img style="display:block" src="https://i.giphy.com/media/3o6ZsU0vEtRS3rHWh2/giphy.webp">

                </div>

            </div>
        </div>
        <!-- Home -->
        <div class="heading">
            <h2>Trending</h2>
        </div>
        <section class="home" id="home">

            <div id="demo" class="carousel slide w-100 carousel-height" data-bs-ride="carousel">

                <!-- Indicators/dots -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                </div>

                <!-- The slideshow/carousel -->
                <div class="carousel-inner">
                    <div class="carousel-item active ">

                        <img src="https://www.visioninterchange.com/sneaker-animation.gif" class="d-block w-100 carousel-image">
                        <a  href="shop"><button style="position:absolute; bottom:10%;left:50%; transform: translateX(-50%)" class="btn btn-black btn-lg">Shop</button></a>
                    </div>
                    <div style="background-image:" class="carousel-item">

                        <div class="row">
                            <div style="background-color:#F4E4EC " class="col-md-5">
                                <div class="banner">
                                    <div class="typed_wrap">
                                        <h1>Welcome to <span class="typed"></span></h1>
                                    </div>
                                </div>
                                <img id="tshirt" src="${pageContext.request.contextPath}/images/TeeGift-removebg-preview.png" class="d-block w-100 carousel-image">
                            </div>
                            <div style="background-color: #F4E4EC" class="col-md-7">
                                <img src="${pageContext.request.contextPath}/img/tsg_item.png" class="d-block w-100 carousel-image">
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">

                        <img src="${pageContext.request.contextPath}/images/slide-1.jpg" alt="Chicago" class="d-block w-100 carousel-image">
                        <a  href="shop"><button style="position:absolute; bottom:10%;left:50%; transform: translateX(-50%)" class="btn btn-black btn-lg">Shop</button></a>
                    </div>
                </div>

                <!-- Left and right controls/icons -->
                <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
<!--                    <span class="carousel-control-prev-icon"></span>-->
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
<!--                    <span class="carousel-control-next-icon"></span>-->
                </button>
            </div>

        </section>

        <!-- Featured -->
        <section class="featured" id="featured">
            <!-- Heading -->
            <div class="heading">
                <h2>Featured</span></h2>
            </div>

            <div class="featured-container container">
                <!-- Box 1 -->
                <div class="box">
                    <img src="${pageContext.request.contextPath}/img/featured1.png" alt="shoe">


                    <div class="text">
                        <h2>New Collection <br>Of Shoes</h2>
                        <a href="#">View More</a>
                    </div>
                </div>
                <!-- Box 2 -->
                <div class="box">
                    <div class="text">
                        <h2>20% Discount <br>On Shoes</h2>
                        <a href="#">View More</a>
                    </div>
                    <img src="${pageContext.request.contextPath}/img/featured2.png" alt="shoe">
                </div>


            </div>
<div class="carousel__3d__block">
  <ul class="carousel__3d">
    <li class="items main-pos" id="1">
        <img style="width: 100%" src="https://i.giphy.com/media/69jF9dWrxSXMeIcvoG/giphy.webp">
     </li>
    <li class="items right-pos" id="2">
        <img style="width: 100%" src="https://i.giphy.com/media/8coNFsf1l44cWdprSO/giphy.webp">

    </li>
    <li class="items back-pos" id="3">
         <img style="width: 100%" src="https://i.giphy.com/media/URkLZvIVcOo4OckpIb/giphy.webp">

    </li>
    <li class="items back-pos" id="4">
             <img style="width: 100%" src="https://i.giphy.com/media/2ipOoFGvxkuSHWo3J8/giphy.webp">

    </li>
    <li class="items back-pos" id="5">
              <img style="width: 100%" src="https://i.giphy.com/media/LqJBnt5oLGkwhd3U9f/giphy.webp">

    </li>
    <li class="items back-pos" id="6">
          <img style="width: 100%" src="https://i.giphy.com/media/1Rj2QCQ81QepeyFnkb/giphy.webp">

    </li>
   
  </ul>

    
</div>

                
        </section>
        <!-- Shop -->
        <section class="shop" id="shop">
            <div class="heading">
                <h2>Shop Now</h2>
            </div>
            <!-- Shop Content -->
            <div class="shop-container container">
                <%                    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("listProduct");
                    for (int i = 0; i < list.size(); i++) {
                %>
                <div class="box">
                    <img src="<%=list.get(i).getImage()%>" alt="">
                    <h2><%=list.get(i).getName()%></h2>
                    <span><%=formatter.format(list.get(i).getPrice()) + " VND"%></span>
                    <a href="product-detail?id=<%=list.get(i).getId()%>"><i class='bx bx-cart-alt'></i></a>
                </div>
                <%
                    }
                %>
            </div>
        </section>



        <%@include file="./../../components/footer.jsp" %>
        <script>
            function changeTheme() {
                var theme = document.querySelector('.lightmode');
                if (document.body.style.background == "white") {
                    document.body.style.background = "black";
                    document.body.style.color = "black";
                    document.querySelectorAll("span").style.color = "white"

                } else {
                    document.body.style.background = "white";
                    document.body.style.color = "black";

                }
            }
        </script>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/1.1.1/typed.min.js"></script>
        <script>
            $(function () {
                $(".typed").typed({
                    strings: ["The Sneaker Garden.", "Color Dream Shoes.", "All Walks of Life."],
                    // Optionally use an HTML element to grab strings from (must wrap each string in a <p>)
                    stringsElement: null,
                    // typing speed
                    typeSpeed: 30,
                    // time before typing starts
                    startDelay: 1200,
                    // backspacing speed
                    backSpeed: 20,
                    // time before backspacing
                    backDelay: 500,
                    // loop
                    loop: true,
                    // false = infinite
                    loopCount: 5,
                    // show cursor
                    showCursor: false,
                    // character for cursor
                    cursorChar: "|",
                    // attribute to type (null == text)
                    attr: null,
                    // either html or text
                    contentType: 'html',
                    // call when done callback function
                    callback: function () {},
                    // starting callback function before each string
                    preStringTyped: function () {},
                    //callback for every typed string
                    onStringTyped: function () {},
                    // callback for reset
                    resetCallback: function () {}
                });
            });

        </script>
        <script>var prevScrollpos = window.pageYOffset;

            /* Get the header element and it's position */
            var headerDiv = document.querySelector("header");
            var headerBottom = headerDiv.offsetTop + headerDiv.offsetHeight;

            window.onscroll = function () {
                var currentScrollPos = window.pageYOffset;

                /* if we're scrolling up, or we haven't passed the header,
                 show the header at the top */
                if (prevScrollpos > currentScrollPos || currentScrollPos < headerBottom) {
                    headerDiv.style.top = "0";
                } else {
                    /* otherwise we're scrolling down & have passed the header so hide it */
                    headerDiv.style.top = "-20rem";
                }

                prevScrollpos = currentScrollPos;
            }
        </script>
        <script>
            //slideshow style interval
var autoSwap = setInterval(swap, 2000);
//pause slideshow and reinstantiate on mouseout
$("ul, span").hover(
  function() {
    clearInterval(autoSwap);
  },
  function() {
    autoSwap = setInterval(swap, 3500);
  }
);

//global variables
var items = [];
var startItem = 1;
var position = 0;
var itemCount = $(".carousel__3d li.items").length;
var leftpos = itemCount;
var resetCount = itemCount;

//unused: gather text inside items class
$("li.items").each(function(index) {
  items[index] = $(this).text();
});

//swap images function
function swap(action) {
  var direction = action;

  //moving carousel backwards
  if (direction == "counter-clockwise") {
    var leftitem = $(".left-pos").attr("id") - 1;
    if (leftitem == 0) {
      leftitem = itemCount;
    }

    $(".right-pos")
      .removeClass("right-pos")
      .addClass("back-pos");
    $(".main-pos")
      .removeClass("main-pos")
      .addClass("right-pos");
    $(".left-pos")
      .removeClass("left-pos")
      .addClass("main-pos");
    $("#" + leftitem + "")
      .removeClass("back-pos")
      .addClass("left-pos");

    startItem--;
    if (startItem < 1) {
      startItem = itemCount;
    }
  }

  //moving carousel forward
  if (direction == "clockwise" || direction == "" || direction == null) {
    function pos(positionvalue) {
      if (positionvalue != "leftposition") {
        //increment image list id
        position++;

        //if final result is greater than image count, reset position.
        if (startItem + position > resetCount) {
          position = 1 - startItem;
        }
      }

      //setting the left positioned item
      if (positionvalue == "leftposition") {
        //left positioned image should always be one left than main positioned image.
        position = startItem - 1;

        //reset last image in list to left position if first image is in main position
        if (position < 1) {
          position = itemCount;
        }
      }

      return position;
    }

    $("#" + startItem + "")
      .removeClass("main-pos")
      .addClass("left-pos");
    $("#" + (startItem + pos()) + "")
      .removeClass("right-pos")
      .addClass("main-pos");
    $("#" + (startItem + pos()) + "")
      .removeClass("back-pos")
      .addClass("right-pos");
    $("#" + pos("leftposition") + "")
      .removeClass("left-pos")
      .addClass("back-pos");

    startItem++;
    position = 0;
    if (startItem > itemCount) {
      startItem = 1;
    }
  }
}

//next button click function
$("#next").click(function() {
  swap("clockwise");
});

//prev button click function
$("#prev").click(function() {
  swap("counter-clockwise");
});

//if any visible items are clicked
$("li").click(function() {
  if ($(this).attr("class") == "items left-pos") {
    swap("counter-clockwise");
  } else {
    swap("clockwise");
  }
});

        </script>
    </body>


</html>