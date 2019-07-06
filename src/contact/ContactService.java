package contact;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

// 실제로 이메일이 보내지는 클래스
public class ContactService {
	public void mailSender(ContactDTO dto) throws Exception {
		String host = "smtp.gmail.com"; // smtp 서버 주소
		// @gmail.com은 입력하지 않음
		
//		고객의 소리 전용 계정
		String username = "ht941227"; // ht941227@gmail.com
		String password = "qkrwnsdud1324"; // gmail 비밀번호
		int port = 587; // 포트번호

		String name = dto.getName();
		String category = dto.getCategory();
		String email = dto.getEmail(); // 보내는 이 메일 주소
		String subject = dto.getSubject(); // 제목
		String message = dto.getMessage(); // 메일 본문

		// 정보를 담기 위한 객체 생성
		Properties props = System.getProperties();

		// SMTP 서버 정보 설정 (고정값)
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		Message mimeMessage = new MimeMessage(session); // MimeMessage
		// 이메일 발신자
		// (이메일 주소는 폼에 입력한 이메일 주소가 아닌 gmail 주소로 표시됨)
		mimeMessage.addFrom(new InternetAddress[] {
				new InternetAddress("ht941227@gmail.com", "고객의 소리") });
		// 수신자 .TO .CC(참조) .BCC(숨은참조)
		mimeMessage.setRecipient(Message.RecipientType.TO, 
				new InternetAddress("heffy127@gmail.com"));
		mimeMessage.setSubject(category + " : " + subject);
		mimeMessage.setText( "Category : " + category + "\nSubject : " + subject + "\nFrom : " + name + "<" + email + ">" +"\nCc : \n" + message +
				"\n\n\n * 본 메일은 HT 고객의 소리를 통해서 온 의견입니다. *");
		Transport.send(mimeMessage);	// gmail서버로 넘어감
	}
}
