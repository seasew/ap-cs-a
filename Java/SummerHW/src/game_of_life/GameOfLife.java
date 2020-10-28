package game_of_life;

public class GameOfLife {
	
	public static final int GRID_SIZE = 20;
	private Grid grid;
	private int gen;

	public GameOfLife()
	{
		grid = new Grid(GRID_SIZE);
		gen = 0;
	}

	/**
	 * Changes to the next generation of grid.
	 */
	public void next()
	{
		Grid newGrid = new Grid(grid);
		for (int i = 0; i < GRID_SIZE; i++)
		{
			for (int j = 0; j < GRID_SIZE; j++)
			{
				int neighbors = grid.getNeighbors(i, j);
			
				if (grid.get(i, j))
				{
					// cell dies with too few or too many neighbors
					if (neighbors <= 1 || neighbors >= 4)
					{
						newGrid.set(i, j, false);
					}
				}
				else
				{
					// populate cell with 3 neighbors
					if (neighbors == 3)
					{
						newGrid.set(i, j, true);
					}
				}
			}
		}
		gen++;
		
		grid = newGrid;
	}

	/**
	 * Get cell at index.
	 * @param i
	 * @param j
	 * @return
	 */
	public boolean getCell(int i, int j)
	{
		return grid.get(i, j);
	}

	/**
	 * Toggles the cell at position. If originally filled, remove the cell. If originally empty, fill the cell.
	 * @param i
	 * @param j
	 * @return
	 */
	public boolean toggleCell(int i, int j)
	{
		return grid.set(i, j, !grid.get(i, j));
	}

	/**
	 * Resets the grid and generation number.
	 */
	public void reset()
	{
		grid.reset();
		gen = 0;
	}

	/**
	 * Returns the grid and generation number in String form.
	 * @return the String representing the grid
	 */
	public String toString()
	{
		return "Generation: " + gen + "\n" + grid.toString();
	}


}
