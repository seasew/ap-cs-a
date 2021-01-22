package animal;

import java.util.Arrays;

public class AnimalRunner {

	public static void main(String[] args) {
		Animal[] animals = { new Horse(2000, "Hulk"),
				new Wombat(),
				new Wombat(1600, "Bessie"),
				new Cow(1700, "Moohead"),
				new Wombat(),
				new Wildebeest(1900, "Cowculus") };
		
		printArray(animals);
		for (Animal a : animals) 
		{
			a.eat(200);
		}
		
		Arrays.sort(animals);
		printArray(animals);
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
