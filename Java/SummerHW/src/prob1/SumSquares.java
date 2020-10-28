package prob1;

public class SumSquares {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(sumSquares(-2, 2));
		System.out.println(sumSquares(1, 5));
	}
	
	// takes the sum of the squares between x and y (x < y)
	private static int sumSquares(int x, int y)
	{
		int result = 0;
		for (int i = x; i <= y; i++)
		{
			result += i * i;
		}
		return result;
	}

}
