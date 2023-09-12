package bank;
import javax.crypto.spec.*;
import java.security.*;
import javax.crypto.*;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

 
public class RC5
{
    static 
    {
        Security.addProvider(new BouncyCastleProvider());
    }
         
   private static final String algorithm = "RC5";
  
//   public static void main(String []args) throws Exception {
//      String toEncrypt = "9423a7d9a3539ae2ce3ad213e5bf0391a35736e883e7decfb7914031b26aadefecaa3a25e4cb7a9f90f5b531778aa2d1a90eab936ec0c520612607008fdc89f3";
////  
//      System.out.println("Encrypting...");
//      byte[] encrypted = encrypt(toEncrypt, "KLMNOPQRSTbcdefg");
//      System.out.println("Encrypted text: " + encrypted);
//  
//      System.out.println("Decrypting...");
//      String decrypted = decrypt(encrypted, "KLMNOPQRSTbcdefg");
//     
//      System.out.println("Decrypted text: " + decrypted);
//   }
 
   public static byte[] encrypt(String toEncrypt, String key) throws Exception {
      // create a binary key from the argument key (seed)
//        KeyGenerator kg = KeyGenerator.getInstance(algorithm); 
//      SecureRandom sr = new SecureRandom(key.getBytes());
//       //int bitsize=128;
//      kg.init(sr);
//      SecretKey sk = kg.generateKey();
  Key aesKey = new SecretKeySpec(key.getBytes(), algorithm);
      // create an instance of cipher
      Cipher cipher = Cipher.getInstance(algorithm);
  
      // initialize the cipher with the key
      cipher.init(Cipher.ENCRYPT_MODE, aesKey);
  
      // enctypt!
      byte[] encrypted = cipher.doFinal(toEncrypt.getBytes());
  
      return encrypted;
   }
  
   public static String decrypt(byte[] toDecrypt, String key) throws Exception {
      // create a binary key from the argument key (seed)
//      SecureRandom sr = new SecureRandom(key.getBytes());
//      KeyGenerator kg = KeyGenerator.getInstance(algorithm);
//      kg.init(sr);
//      SecretKey sk = kg.generateKey();
   Key aesKey = new SecretKeySpec(key.getBytes(), algorithm);
      // do the decryption with that key
      Cipher cipher = Cipher.getInstance(algorithm);
      cipher.init(Cipher.DECRYPT_MODE, aesKey);
      byte[] decrypted = cipher.doFinal(toDecrypt);
  
      return new String(decrypted);
   }
}
   

