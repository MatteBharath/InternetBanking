package bank;

//import bigjava.math.BigInteger;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import static java.util.Objects.hash;

public class SHAExample {
	
//	public static void main(String[] args) throws NoSuchAlgorithmException {
//		String passwordToHash = "password";
//		String salt = getSalt();
//		
//		String securePassword = get_SHA_1_SecurePassword(passwordToHash, salt);
//		System.out.println(securePassword);
//		
//		securePassword = get_SHA_256_SecurePassword(passwordToHash, salt);
//		System.out.println(securePassword);
//		
//		securePassword = get_SHA_384_SecurePassword(passwordToHash, salt);
//		System.out.println(securePassword);
//		
//		securePassword = get_SHA_512_SecurePassword(passwordToHash);
//		System.out.println(securePassword);
//	}

	public static String get_SHA_1_SecurePassword(String passwordToHash, String salt)
	{
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(salt.getBytes());
			byte[] bytes = md.digest(passwordToHash.getBytes());
			StringBuilder sb = new StringBuilder();
			for(int i=0; i< bytes.length ;i++)
			{
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
			generatedPassword = sb.toString();
		} 
		catch (NoSuchAlgorithmException e) 
		{
			e.printStackTrace();
		}
		return generatedPassword;
	}
	
	public static String get_SHA_256_SecurePassword(String passwordToHash)
	{
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			//md.update(salt.getBytes());
			byte[] bytes = md.digest(passwordToHash.getBytes());
			StringBuilder sb = new StringBuilder();
			for(int i=0; i< bytes.length ;i++)
			{
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
			generatedPassword = sb.toString();
		} 
		catch (NoSuchAlgorithmException e) 
		{
			e.printStackTrace();
		}
		return generatedPassword;
	}
	
	public static String get_SHA_384_SecurePassword(String passwordToHash, String salt)
	{
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-384");
			md.update(salt.getBytes());
			byte[] bytes = md.digest(passwordToHash.getBytes());
			StringBuilder sb = new StringBuilder();
			for(int i=0; i< bytes.length ;i++)
			{
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
			generatedPassword = sb.toString();
		} 
		catch (NoSuchAlgorithmException e) 
		{
			e.printStackTrace();
		}
		return generatedPassword;
	}
	
	public static String get_SHA_512_SecurePassword(String passwordToHash)
	{
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			//md.update(salt.getBytes());
			byte[] bytes = md.digest(passwordToHash.getBytes());
                         BigInteger number = new BigInteger(1, bytes);  
			StringBuilder sb = new StringBuilder(number.toString(16));
			while (sb.length() < 32)
                        {
                            sb.insert(0, '0');
                        }  
			generatedPassword = sb.toString();
		} 
		catch (NoSuchAlgorithmException e) 
		{
			e.printStackTrace();
		}
		return generatedPassword;
	}
	
	//Add salt
	public static String getSalt() throws NoSuchAlgorithmException
	{
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		byte[] salt = new byte[161];
		sr.nextBytes(salt);
		return salt.toString();
	}
}
