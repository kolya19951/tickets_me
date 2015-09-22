package Mail;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public abstract class SendMailSSL {
    public static void sendEmail(String to, String from) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.yandex.ru");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", 465);

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("tickets.bus@yandex.ua","610917qwerty");
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("tickets.bus@yandex.ua"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse("kolya.simotyuk@gmail.com"));
            message.setSubject("Testing Subject");
            message.setText("Vash bilet zaregestrirovan," +
                    "\n\n Spasibo za ispolzovanye BusTickets");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException ex) {
            throw new RuntimeException(ex);
        }
    }
}