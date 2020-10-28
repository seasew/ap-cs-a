package prob3;

public class InitArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] arr = new int[20][10];
		  initArray(arr); // initialize the array
		  System.out.println(arr[3][5]);   // prints 15 (3 * 5)
		  System.out.println(arr[17][4]);  // prints 68 (17 * 4)
	}
	
	private static void initArray(int[][] arr)
	{
		for (int i = 0; i < arr.length; i++)
		{
			for (int j = 0; j < arr[i].length; j++)
			{
				arr[i][j] = i * j;
			}
		}
	}

}
