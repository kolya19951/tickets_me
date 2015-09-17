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
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" type="text/css" href="reset.css">
    <script type="text/javascript" src="javascript.js"></script>

    <title></title>
</head>
<body>
<div class="menu">
    <ul>
        <li><a href="index">Главная</a></li>
        <li><a href="reservation">Бронирование</a></li>
        <li><a href="info">Информация</a></li>
        <li><a href="contacts">Связь</a></li>
    </ul>
</div>
<div class="main">
    <div class="why_bus">
        <div class="bus_text"><p>Почему путешествие на автобусе это удобно?</p>
            <p>Мы вам приведем три примера, после которых вы полностью перейдете на сторону автобусов.</p>
            <p>Во первых комфортные места, хорошие новые автобусы, wifi, кондиционер, вежливый водитель</p>
            опытный, который вам всегде окажет помощь, уютные кресла, телевизор.</p>
            <p>Остановки. Вы сможете выйти размяться, подышать воздухом, пообщаться с соседом по креслу</p>
            <p>А самое главное это быстрая, качественная и удобная поездка. 16 часовые плацкарты это уже в прошлом.</p>
            <p>Путешествовать можно семьей, с коллегами, с супрогом или супрогой, или самому.</p>
            <br>
            <p>Довольный пассажир важнее всего!</p>
        </div>
    </div>
    <div class="step">
        <div class="step_one">
            <center><p>1. Выбор рейса, даты</p></center>
        </div>
        <div class="step_two" style="background:#1DCCD5;"   >
            <center><p>2. Бронирование</p></center>
        </div>
        <div class="step_three">
            <center><p>3. Покупка</p></center>
        </div>
    </div>
      <div id="previous" style="display: none">
        </div>
        <div class="bus">
            <table class="busTable">
                <tr>
                <%
                    Seat[][] indexableSeats = (Seat[][]) request.getAttribute("indexableSeats");
                    Integer maxRow = (Integer) request.getAttribute("maxRow");

                    for (int i = 0; i < maxRow; i++) {
                %>
                <tr><%
                    for (int j = 0; j < 5; j++) {
                        if (indexableSeats[j][i] != null) {
                %>
                    <td class="<%=indexableSeats[j][i].getPrice()%>" onClick="choosePlace(this)" id="<%=indexableSeats[j][i].getId()%>"><%=indexableSeats[j][i].getSeat_num()%>
                    </td>
                    <%
                            }
                            else %><td id="0" style="background-color: black">0</td><%;
                        }
                    %></tr>
                <%
                    }
                %>
            </table>
        </div>
    <div class="info">
        <div id="placeNum">Номер места</div>
        <div id="cost">Стоимость билета</div>
            <button class="button" id="chooseButton" onClick="goToStep3()">Выбрать место</button>
        </div>

</div>
<div class="footer">
    <div class="footer_text">
        <p>Сайт 2015 ©</p>
    </div>
</div>
</body>
<form action="step3" method="get" style="display: none">
    <input type="text" value="0" id="placeId"name="id">
    <input type="submit" id="sendIdButton">
</form>
</html>
