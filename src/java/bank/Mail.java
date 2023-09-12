package bank;

import java.io.File;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;

public class Mail {

  public static   String d_email = "techcitiforyou@gmail.com",
            d_password = "techcititech@1234",
            d_host = "smtp.gmail.com",
            d_port = "465";

   
    public static void SendMail(String m_to,String m_subject,String m_text, String attch_file) {
        Properties props = new Properties();
        props.put("mail.smtp.user", d_email);
        props.put("mail.smtp.host", d_host);
        props.put("mail.smtp.port", d_port);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        //props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", d_port);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        SecurityManager security = System.getSecurityManager();

        try {
            Authenticator auth = new SMTPAuthenticator();
            Session session = Session.getInstance(props, auth);
            //session.setDebug(true);

            MimeMessage msg = new MimeMessage(session);
            //msg.setText(m_text);
            msg.setContent(m_text, "text/html");
            msg.setSubject(m_subject);
            msg.setFrom(new InternetAddress(d_email));
            String[] m_m_to = m_to.split(",");
            for (int i = 0; i < m_m_to.length; i++) {
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(m_m_to[i]));
            }


            MimeBodyPart messageBodyPart = new MimeBodyPart();

            messageBodyPart.setText(m_text);
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            // Part two is attachment
            if (!attch_file.equals("")) {
                String[] Att_Files = attch_file.split(",");
                for (int i = 0; i < Att_Files.length; i++) {
                    messageBodyPart = new MimeBodyPart();
                    DataSource source = new FileDataSource(Att_Files[i]);
                    messageBodyPart.setDataHandler(new DataHandler(source));
                    File ob = new File(Att_Files[i]);
                    messageBodyPart.setFileName(ob.getName());
                    multipart.addBodyPart(messageBodyPart);
                }
            }
            msg.setContent(multipart);
            Transport.send(msg);
        } catch (Exception mex) {
            mex.printStackTrace();
        }
    }

    public static class SMTPAuthenticator extends javax.mail.Authenticator {

        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(d_email, d_password);

        }
    }

   public static void main(String a[]) {
    Mail ob = new Mail();
    ob.SendMail("arunfantazy@gmail.com", "kernelroutekit", "kernelroutekit........", "");
    }
     
}
