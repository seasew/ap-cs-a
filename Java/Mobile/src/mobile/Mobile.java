package mobile;

public class Mobile implements Structure {
	
	private Branch left;
	private Branch right;

	public Mobile(Branch left, Branch right) {
		this.left = left;
		this.right = right;
	}

	@Override
	public double getWeight() {
		double w = left.getStructure().getWeight() + right.getStructure().getWeight();
		
		return w;
	}

	@Override
	public boolean isBalanced() {
		return left.torque() == right.torque();
	}
}