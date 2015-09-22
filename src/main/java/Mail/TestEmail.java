package Mail;

/**
 * Created by Коля on 18.09.2015.
 */

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

// Отправка простого сообщения с типом контента "text/plain"
public class TestEmail {

    public static void main(String[] args) {

// Сюда необходимо подставить адрес получателя сообщения
        String to = "denis.drabchuk@gmail.com";
        String from = "";
// Сюда необходимо подставить SMTP сервер, используемый для отправки
        String host = "smtp.yourisp.net";

// Создание свойств, получение сессии
        Properties props = new Properties();

// При использовании статического метода Transport.send()
// необходимо указать через какой хост будет передано сообщение
        props.put("mail.smtp.host", host);
// Включение debug-режима
        props.put("mail.debug", "true");
        Session session = Session.getInstance(props);

        try {
// Создание объекта сообщения
            Message msg = new MimeMessage(session);

// Установка атрибутов сообщения
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject("Test E-Mail through Java");
            msg.setSentDate(new Date());

// Установка тела сообщения
            msg.setText("This is a test of sending a " +
                    "plain text e-mail through Java.\n" +
                    "Here is line 2.");

// Отправка сообщения
            Transport.send(msg);
        } catch (MessagingException mex) {
// Печать информации об исключении в случае его возникновения
            mex.printStackTrace();
        }
    }
}
