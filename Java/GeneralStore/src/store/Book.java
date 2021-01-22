package store;

public class Book extends Good {

	private int length;
	
	public Book(String description, double price, int length)
	{
		super(description, price);
		this.length = length;
	}
	
	@Override
	public String toString()
	{
		return super.toString()
				+ "length: " + length + "\n";
	}
}
