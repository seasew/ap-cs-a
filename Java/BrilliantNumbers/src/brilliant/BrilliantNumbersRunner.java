package brilliant;

import java.util.ArrayList;
import java.util.Scanner;

public class BrilliantNumbersRunner {
	
	public static void main(String[] args) {

		Scanner in = new Scanner(System.in);
	
		System.out.print("Enter a positive integer: " + "\n");
		int n = in.nextInt();
	
		BrilliantNumbers bn = new BrilliantNumbers(n);
		
		// print list of prime factors
		System.out.print("Prime factors: [");
		ArrayList<Integer> factors = bn.findFactors();
		for (int i = 0; i < factors.size(); i++)
		{
			System.out.print(factors.get(i));
			if (i != factors.size() - 1)
			{
				System.out.print(", ");
			}
		}
		System.out.print("]\n");
		
		// print brilliance
		System.out.println("This number is " + (bn.isBrilliant() ? "" : "not ") + "brilliant!");
		
		in.close();
	}
}