package it3191.companion.util;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;
import java.util.Random;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class Hash {
	private static final Random random = new SecureRandom();
	private static final int ITERATIONS = 10000;
	private static final int KEY_LENGTH = 256;

	public static byte[] getNextSalt() {
		byte[] salt = new byte[16];
		random.nextBytes(salt);
		return salt;
	}

	public static byte[] hash(char[] password, byte[] salt) {
		char[] pwd = cloneArrayAndEraseOriginal(password);
		KeySpec spec = new PBEKeySpec(pwd, salt, ITERATIONS, KEY_LENGTH);
		try {
			SecretKeyFactory f = SecretKeyFactory
					.getInstance("PBKDF2WithHmacSHA1");
			return f.generateSecret(spec).getEncoded();
		} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
			throw new AssertionError("Error while hashing a password: "
					+ e.getMessage(), e);
		}
	}

	private static char[] cloneArrayAndEraseOriginal(char[] password) {
		char[] pwd = password.clone();
		Arrays.fill(password, Character.MIN_VALUE);
		return pwd;
	}

}
