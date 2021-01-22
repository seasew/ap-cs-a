package animal;

public class Wombat extends Animal {

	
	public Wombat()
	{
		super(1800, "Anonymous Wombat");
	}
	
	public Wombat(int weight, String name)
	{
		super(weight, name);
	}
	
	@Override
	public void eat(int n) {
		System.out.println("Wombats don't gain weight when they eat!");
	}
	
}
