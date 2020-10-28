package game_of_life;

public class Grid {

	private int size;
	private boolean[][] game;
	
	public Grid(final int size)
	{
		this.size = size;
		this.reset();
	}
	
	public Grid (Grid copyGrid)
	{
		this.size = copyGrid.getSize();
		this.reset();
		for (int i = 0; i < copyGrid.getSize(); i++)
		{
			for (int j = 0; j< copyGrid.getSize(); j++)
			{
				this.set(i, j, copyGrid.get(i, j));
			}
		}
	}
	
	public int getSize()
	{
		return size;
	}
	
	public int getNeighbors(int i, int j)
	{
		int neighbors = 0;
		
		for (int di = -1; di <= 1; di++)
		{
			for (int dj = -1; dj <= 1; dj++)
			{
				// if is valid indexes and filled
				if (!(di == 0 && dj == 0) && this.get(di + i, dj + j))
				{
					neighbors++;
				}
			}
		}
		return neighbors;
	}
	
	public boolean set(int i, int j, boolean val)
	{
		if (isValidPos(i, j))
		{
			game[i][j] = val;
			return true;
		}
		return false;
	}
	
	public boolean get(int i, int j)
	{
		if (isValidPos(i, j))
		{
			return game[i][j];
		}
		return false;
	}
	
	public void reset()
	{
		// initialize game board with default false values
		game = new boolean[size][size]; 
	}
	
	public String toString()
	{
		String result = "";
		
		for (boolean[] row : game)
		{
			result += "|";
			for (boolean val : row)
			{
				result += (val ? "X" : " ") + "|";
			}
			result += "\n";
		}
		return result;
	}

	private boolean isValidPos(int i, int j)
	{
		if (i >= 0 && i < size && j >= 0 && j < size)
		{
			return true;
		}
		return false;
	}

}
