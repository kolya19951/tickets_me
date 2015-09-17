<%--
  Created by IntelliJ IDEA.
  User: Коля
  Date: 15.09.2015
  Time: 0:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Step 3</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link rel="stylesheet" type="text/css" href="reset.css">
  <script type="text/javascript" src="javascript.js"></script>
</head>
<body>
<div class="menu">
  <ul>
    <li><a href="">Главная</a></li>
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
  <div class="step" style="background: #1DCCD5;">
    <div class="step_one" style="background: #0294B5;">
      <center><p>1. Выбор рейса, даты</p></center>
    </div>
    <div class="step_two" style="background: #0294B5;">
      <center><p>2. Бронирование</p></center>
    </div>
    <div class="step_three">
      <center><p>3. Покупка</p></center>
    </div>
  </div>
  <div class="payments">
    <div class="form_pay">
      <div id="pay_content">
        <h1>Введите пожалуйста, данные</h1>
        <br>
        <hr>
        <div class="table_pay">
          <div class="pay_row">
            <div class="name_cell">
              <h2>Фамилия</h2>
            </div>
            <div class="name_cell">
              <h2>Имя</h2>
            </div>
          </div>
          <div class="pay_row">
            <div class="pay_cell">
              <div class="input_pay">
              <input type="text" class="input_design" placeholder="" required max="64" id="surname">
                </div>
            </div>
            <div class="pay_cell">
              <div class="input_pay">
              <input type="text" class="input_design" placeholder="" required max="64" id="name">
                </div>
            </div>
          </div>
          <br>
          <hr>
          <div class="pay_row">
            <div class="input_pay pay_cell">
              <h2>Телефон</h2>
            </div>
            <div class="input_pay pay_cell">
            </div>
          </div>
          <div class="pay_row">
            <div class="pay_cell">
              <div class="input_pay">
              <input type="text" class="input_design" placeholder="" required max="64" id="phone">
                </div>
            </div>
            <div class="pay pay_cell">
              <div class="pay_text">
              <h3>Нужен для связи с вами в случае переноса или отмены рейса, проблем с оплатой и прочих вопросов.</h3>
            </div>
              </div>
          </div>
          <div class="pay_row">
            <div class="name_cell">
              <div class="name_pay">
              <h2>E-mail</h2>
                </div>
            </div>
            <div class="pay_cell">
            <div class="input_pay">
            </div>
              </div>
          </div>
          <div class="pay_row">
            <div class="pay_cell">
              <div class="input_pay">
              <input type="text" class="input_design" placeholder="" required max="64" id="email">
                </div>
            </div>
            <div class="input_pay pay_cell">
              <div class="pay_text">
              <h3>Заполните, если хотите получить билет на email после оплаты.</h3>
                </div>
            </div>
          </div>
          <div class="pay_row">
            <div class="pay_submit">
              <input type="submit" value="Перейти к оплате" onClick="goToPay()" class="pay_button">
            </div>
            <div class="input_pay pay_cell">
            </div>
          </div>
        </div>
      </div>

    </div>
    <div class="detals">
      <div id="detals_content">
        <h1>Детали заказа</h1>
      <div id="departureCity" class="detals_text"><%=request.getAttribute("departureCity")%></div>
      <div id="departureStation" class="detals_text"><%=request.getAttribute("departureStation")%></div>
      <div id="departureDate" class="detals_text"><%=request.getAttribute("departureDate")%></div>
      <div id="departureTime" class="detals_text"><%=request.getAttribute("departureTime")%></div>
      <div id="arrivalCity" class="detals_text"><%=request.getAttribute("arrivalCity")%></div>
      <div id="arrivalStation" class="detals_text"><%=request.getAttribute("arrivalStation")%></div>
      <div id="arrivalDate" class="detals_text"><%=request.getAttribute("arrivalDate")%></div>
      <div id="arrivalTime" class="detals_text"><%=request.getAttribute("arrivalTime")%></div>
      <div id="price" class="detals_text"><%=request.getAttribute("price")%></div>
    </div>
  </div>
</div>
  </div>
<div class="footer">
  <div class="footer_text">
    <p>Сайт 2015 (С)</p>
  </div>
</div>
</body>
<form id="payment" name="payment" method="post" action="https://sci.interkassa.com/" enctype="utf-8" style="display: none">
  <input type="hidden" name="ik_co_id" id="ik_co_id" value="55f353513b1eaff4408b4567" />
  <input type="hidden" name="ik_pm_no" id="ik_pm_no" value="ID_4233" />
  <input type="hidden" name="ik_am" id="ik_am" value="<%=request.getAttribute("price")%>" />
  <input type="hidden" name="ik_cur" id="ik_cur" value="UAH" />
  <input type="hidden" name="ik_desc" id="ik_desc" value="Event Description" />
  <input type="submit" value="Pay" id="pay">
</form>
</html>
