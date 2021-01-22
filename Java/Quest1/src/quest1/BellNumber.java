package quest1;

import java.util.ArrayList;
public class BellNumber {

	public static void main(String[] args) {	
		System.out.println(bellRow(3));   // Should print [5, 7, 10, 15]
		System.out.println(bellNum(3,0)); // Should print 5
		System.out.println(bellNum(3,2)); // Should print 10
		
		System.out.println(bellRow(0));    // prints [1]
		System.out.println(bellRow(3));    // prints [5, 7, 10, 15]
		System.out.println(bellRow(6));    // prints [203, 255, 322, 409, 523, 674, 877]
		
		System.out.println(bellNum(0,0));  // prints 1
		System.out.println(bellNum(3,2));  // prints 10
		System.out.println(bellNum(6,3));  // prints 409


	}

// Complete this method
public static ArrayList<Integer> bellRow(int rowNum) {
		ArrayList<Integer> previous = new ArrayList<Integer>();
		ArrayList<Integer> current = new ArrayList<Integer>();
		previous.add(1);

		// How many rows should we be processing?
		for (int row = 0; row < rowNum; row++) {
			// What is the 0th element of the current row?
			current.add(previous.get(previous.size() - 1));
			// Fill in the current row by using data from the current row
			// and previous row
			for (int column = 0; column < row + 1; column++) {
				current.add(previous.get(column) + current.get(column));
				
				// pascal's triangle implementation below
				/*
				if (column + 1 < previous.size())
				{
				current.add(previous.get(column) + previous.get(column + 1));
				}
				else
				{
					current.add(previous.get(column));
				}
				*/
				
			}
			// The current row becomes the previous row and
			// the new current row gets initialized
			previous = current;
			current = new ArrayList<Integer>();
		}

		// Return the Bell row ArrayList
		return previous;
	}
	
public static int bellNum(int row, int column) {
	// Return the number from (row, column)
	return bellRow(row).get(column);
}
}
