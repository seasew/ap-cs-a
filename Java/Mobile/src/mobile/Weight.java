package mobile;

public class Weight implements Structure {
	
	private double weight;
	
    public Weight(double weight) {
		this.weight = weight;
    }

	@Override
	public double getWeight() {
		return weight;
	}

	@Override
	public boolean isBalanced() {
		return true;
	}
}