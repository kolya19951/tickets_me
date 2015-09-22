<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Контакты</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/fonts.css">
</head>

<body>
<div class="menu">
    <center><div class="menu_table">
        <div class="menu_row">
            <div class="menu_cell menu_title">${Home}</div>
            <div class="menu_cell menu_title">${Contact}</div>
            <div class="menu_cell menu_title">${BuyTicket}</div>
            <div class="menu_cell menu_title">${Info}</div>
        </div>
        <div class="menu_row">
            <div class="menu_cell menu_icon"><a href="/"><img src="img/icon/camera.png" width="72" height="72"></a></div>
            <div class="menu_cell menu_icon"><a href="contacts"><img src="img/icon/mail.png" width="72" height="72"></a></div>
            <div class="menu_cell menu_icon"><a href="reservation"><img src="img/icon/money.png" width="72" height="72"></a></div>
            <div class="menu_cell menu_icon"><a href="info"><img src="img/icon/compose.png" width="72" height="72"></a></div>

        </div>
    </div></center>
</div>
    <div class="main">
        <div class="why_bus">
            <div class="bus_text"><p>${Line17}</p>
                <p>${Line18}</p>
                <p>${Line19}</p>
                <br>
                <p>Tickets Bus</p>
            </div>
        </div>
        <div class="info_main">
            <div class="info_one">
            <h1>${InfoDriver}</h1>
            <h2>${Rules}</h2>
            <h2>${ApplyJob}</h2>
            <h3><p>${Requirements1}</p>
                <p>${Requirements2}</p>
                <p>${Requirements3}</p>
                <p>4. </p>
                <p>.........................</p>
                <p>n. </p></h3>
        </div>

        <div class="info_two">
            <h1>${InfoPass}</h1>
            <h2>${Rules}</h2>
            <h2>${Documents}</h2>
            <h3><p>1. .....</p></h3>
        </div>
    </div>
        </div>
<center><div class="footer">
    <div class="footer_menu">
        <ul>
            <li><a href="/">${Home}</a></li>
            <li><a href="contacts">${Contact}</a></li>
            <li><a href="reservation">${BuyTicket}</a></li>
            <li><a href="info">${Info}</a></li>
        </ul>
    </div>
    <div class="footer_title">
        <p>${Site} 2015 ©</p>
    </div>
</div></center>
</body>
</html>
