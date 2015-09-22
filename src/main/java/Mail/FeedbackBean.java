package Mail;

import javax.annotation.Resource;
import javax.faces.bean.ManagedBean;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Created by Коля on 18.09.2015.
 */

@ManagedBean
public class FeedbackBean {

    private String subject;
    private String body;
    @Resource(name = "mymailserver")
    Session session;

    public FeedbackBean(String subject, String body) {
        this.subject = subject;
        this.body = body;
    }

    public String sendEmail() {
        try {
            Message msg = new MimeMessage(session);
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress("kolya.simotyuk@gmail.com"));
            msg.setSubject(subject);
            msg.setText(body);

            Transport.send(msg);
        } catch (AddressException e) {
            e.printStackTrace();
            return "Address Exception";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "Messaging Exception";
        }
        return "Success";
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
