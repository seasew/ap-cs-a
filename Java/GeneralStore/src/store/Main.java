package store;

import java.util.ArrayList;

public class Main {

	public static void main(String[] args)
	{
		ArrayList<Good> inventory = new ArrayList<Good>();
		inventory.add(new Good("Backpack", 15.49));
		inventory.add(new Food("Bread", 3.00, 100));
		inventory.add(new Book("Lemony Snicket", 12.00, 300));
		
		for (Good g : inventory)
		{
			System.out.println(g);
		}
	}
}
