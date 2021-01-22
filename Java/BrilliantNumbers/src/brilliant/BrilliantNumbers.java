package brilliant;

import java.util.ArrayList;

public class BrilliantNumbers {

private int n;

private ArrayList<Integer> factors; 
	
	public BrilliantNumbers(int number){
		factors = new ArrayList<Integer>();
		this.n = number;
	}
	
	private static boolean isPrime(int x)
	{
		// base
		if (x == 1)
		{
			return false;
		}
		
		for (int i = 2; i < x; i++)
		{
			// if divisible
			if (x % i == 0)
			{
				return false;
			}
		}
		
		return true;
	}
	
	public ArrayList<Integer> findFactors()
	{
		if (factors.size() == 0)
		{
			int subN = n;
			for (int i = 2; i <= subN; i++)
			{
				while (subN % i == 0 && isPrime(i))
				{
					factors.add(i);
					subN /= i;
				}
			}
		}		
		return (ArrayList<Integer>) factors.clone();
	}
	
	private static int getNumLen(int x)
	{
		return (x + "").length();
	}
	
	// returns if the number is brilliant
	public boolean isBrilliant()
	{
		findFactors();
		
		if (factors.size() == 2 && getNumLen(factors.get(0)) == getNumLen(factors.get(1)))
		{			
			return true;
		}
		else
		{
			return false;
		}
	}
}
