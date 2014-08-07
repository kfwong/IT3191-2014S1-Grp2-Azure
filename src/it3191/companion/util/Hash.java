package it3191.companion.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;
import java.util.Random;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

import java.security.SecureRandom;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.SecretKeyFactory;

import org.apache.catalina.User;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.sun.org.apache.xml.internal.security.utils.Base64;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

public class Hash {

	/**
	 * Returns a random salt to be used to hash a password.
	 * 
	 * @return a 16 bytes random salt
	 * @throws NoSuchAlgorithmException 
	 */
	public static byte[] getNextSalt() throws NoSuchAlgorithmException {
		// Uses a secure Random not a simple Random
        SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
        // Salt generation 64 bits long
        byte[] bSalt = new byte[8];
        random.nextBytes(bSalt);
         return bSalt;
	}

	public static byte[] getHash(String password, byte[] salt) throws NoSuchAlgorithmException, UnsupportedEncodingException {
	       MessageDigest digest = MessageDigest.getInstance("SHA-1");
	       digest.reset();
	       digest.update(salt);
	       byte[] input = digest.digest(password.getBytes("UTF-8"));
	       for (int i = 0; i < 1000; i++) {
	           digest.reset();
	           input = digest.digest(input);
	       }
	       return input;
	}
	 /**
	    * From a base 64 representation, returns the corresponding byte[] 
	    * @param data String The base64 representation
	    * @return byte[]
	    * @throws IOException
	    */
	   public static byte[] base64ToByte(String data) throws IOException {
	       BASE64Decoder decoder = new BASE64Decoder();
	       return decoder.decodeBuffer(data);
	   }
	 
	   /**
	    * From a byte[] returns a base 64 representation
	    * @param data byte[]
	    * @return String
	    * @throws IOException
	    */
	   public static String byteToBase64(byte[] data){
	       BASE64Encoder endecoder = new BASE64Encoder();
	       return endecoder.encode(data);
	   }

}