package cow;

import java.util.Arrays;

public class Runner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Cow[] cows = {new Cow(2000, "Hulk"),
				new Cow(),
				new Cow(1600, "Bessie"),
				new Cow(1700, "Moohead"),
				new Cow(),
				new Cow(1900, "Cowculus") };
		
		printArray(cows);
		Arrays.sort(cows);
		printArray(cows);
		
	}

	public static void printArray(Object[] arr)
	{
		for (int i = 0; i < arr.length; i++)
		{
			System.out.print(arr[i]);
			if (i != arr.length - 1)
			{
				System.out.print(", ");
			}
		}
		System.out.println("");
	}

}
