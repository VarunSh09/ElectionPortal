package voting;

import java.util.Random;

public class OTPGenerate {
	public static String otp() {
        Random random = new Random(); 

	 	return String.format("%06d",random.nextInt(1000000));

		
		}

}
