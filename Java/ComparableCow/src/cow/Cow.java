package cow;


public class Cow implements Comparable<Cow> {
	
	private int weight;
	private String name;
	
	public Cow()
	{
		weight = 1800;
		name = "Anonymous Cow";
	}
	
	public Cow(int weight, String name)
	{
		this.weight = weight;
		this.name = name;
	}

	@Override
	public int compareTo(Cow o) {
		return this.weight - o.weight;
	}
	
	public String toString()
	{
		return name;
	}
}
