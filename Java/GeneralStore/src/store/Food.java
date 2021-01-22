package store;

public class Food extends Good {

	private double calories;
	
	public Food(String description, double price, double calories)
	{
		super(description, price);
		this.calories = calories;
	}
	
	@Override
	public double calcTax()
	{
		return 0;
	}
	
	@Override
	public String toString()
	{
		return super.toString()
				+ "calories: " + calories + "\n";
	}
}
