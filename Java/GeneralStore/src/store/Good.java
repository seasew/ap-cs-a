package store;

public class Good implements Taxable {

	private String description;
	private double price;
	
	public Good(String description, double price)
	{
		this.description = description;
		this.price = price;
	}
	
	public String getDes()
	{
		return description;
	}
	
	public double getPrice()
	{
		return price;
	}
	
	@Override
	public String toString()
	{
		return "item: " + description + "\n" 
				+ "price: " + price + "\n"
				+ "tax: " + this.calcTax() + "\n";
	}
	
	@Override
	public double calcTax() {
		return this.price * CA_TAX_RATE;
	}

}
