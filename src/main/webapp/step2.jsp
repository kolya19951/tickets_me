<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Entity.Seat" %>
<%@ page import="Model.Observer.SeatPlace" %>
<%--
  Created by IntelliJ IDEA.
  User: Коля
  Date: 14.09.2015
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/fonts.css">
    <script type="text/javascript" src="javascript.js"></script>

    <title>Step 2</title>
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
        <div class="bus_text"><p>${Line5}</p>
            <p>${Line6}</p>
            <p><font color="red">${TextColor1}</font> ${Line7}</p>
            <p><font color="green">${TextColor2}</font> ${Line8}</p>
            <p>${Line9}</p>
            <br>
            <p>Tickets Bus</p>
        </div>
    </div>
    <div class="step">
        <div class="step_row">
        <div class="step_one">
            <center><p>1. ${Step1}</p></center>
        </div>
        <div class="step_two" style="background:#1DCC99;"   >
            <center><p>2. ${Step2}</p></center>
        </div>
        <div class="step_three">
            <center><p>3. ${Step3}</p></center>
        </div>
        </div>
        </div>
      <div id="previous" style="display: none">
        </div>
        <div class="bus">
            <div class="salon">
                <div class="row_place">
                <%
                    Seat[][] indexableSeats = (Seat[][]) request.getAttribute("indexableSeats");
                    Integer maxRow = (Integer) request.getAttribute("maxRow");

                    for (int i = 0; i < 2; i++) {
                %><div class="row_bus">
                        <%
                    for (int j = 0; j < maxRow; j++) {
                        if (indexableSeats[i][j] != null) {
                %>
                    <div title="<%=indexableSeats[i][j].getPrice()%>" class="cell_bus place_free" onClick="choosePlace(this)" id="<%=indexableSeats[i][j].getId()%>"><%=indexableSeats[i][j].getSeat_num()%>
                    </div>
                    <%
                            }%>
                            <%
                        }
                    %></div>
                <%
                    }
                %></div>
                <div class="row_bus">
                    <div class="cell_bus place">
                        &thinsp;
                    </div>
                    <div class="cell_bus place">
                        &thinsp;
                    </div>
                    <div class="cell_bus place">
                        &thinsp;
                    </div>
                    <div class="cell_bus place">
                        &thinsp;
                    </div>
                </div>
                <div class="row_bus">
                    <div class="cell_bus place">
                        &thinsp;
                    </div>
                    <div class="cell_bus place">
                        &thinsp;
                    </div>
                    <div class="cell_bus place">
                        &thinsp;
                    </div>
                    <div class="cell_bus place">
                        &thinsp;
                    </div>
                </div>
                <div class="row_place">
                    <%
                        for (int i = 3; i < 5; i++) {
                    %><div class="row_bus">
                    <%
                        for (int j = 0; j < maxRow; j++) {
                            if (indexableSeats[i][j] != null) {
                    %>
                    <div title="<%=indexableSeats[i][j].getPrice()%>" class="cell_bus place_free" onClick="choosePlace(this)" id="<%=indexableSeats[i][j].getId()%>"><%=indexableSeats[i][j].getSeat_num()%>
                    </div>
                    <%
                        }%>

                    <%
                    }
                    %></div>
                <%
                    }
                %></div>
            </div>
        </div>
    <div class="info">
            <div id="placeNum">${NumberPlace}<div id="num"></div></div>
            <div id="cost">${TicketPrice}<div id="placeCost"></div></div>
    <button class="button_place" id="chooseButton" onClick="goToStep3()">${SelectPrice}</button>
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
<form action="step3" method="get" style="display: none">
    <input type="text" value="0" id="placeId"name="id">
    <input type="submit" id="sendIdButton">
</form>
</html>
