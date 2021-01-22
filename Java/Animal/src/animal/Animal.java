package animal;

public class Animal implements Comparable<Animal> {

	private int weight;
	private String name;
	
	public Animal()
	{
		this.weight = 1800;
		this.name = "Anonymous Animal";
	}
	
	public Animal(int weight, String name)
	{
		this.weight = weight;
		this.name = name;
	}
	
	public void eat(int n)
	{
		this.weight += n;
	}
	
	@Override
	public String toString()
	{
		return name + ":" + weight;
	}
	
	@Override
	public int compareTo(Animal a) {
		return this.weight - a.weight;
	}
}
