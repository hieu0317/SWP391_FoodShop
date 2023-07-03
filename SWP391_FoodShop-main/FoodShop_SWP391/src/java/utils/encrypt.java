package utils;

import java.security.MessageDigest;
import java.util.Random;

import org.apache.tomcat.util.codec.binary.Base64;


public class encrypt {
	// md5
	// sha-1 => thường được sử dụng
	public String toSHA1(String str) {
		String salt = "zdj?fkal29jdlf3ad@asd.d/a23";// Làm cho mật khẩu phức tap
		String result = null;
		
		str = str + salt;
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = Base64.encodeBase64String(md.digest(dataBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
        
         public String generateOtp(int captchaLength) {
        String captcha = "1234567890";
        StringBuilder captchaBuffer = new StringBuilder();
        Random random = new Random();
        while (captchaBuffer.length() < captchaLength) {
            int index = random.nextInt(captcha.length());
            captchaBuffer.append(captcha.charAt(index));
        }
        
        return captchaBuffer.toString();
    }
}