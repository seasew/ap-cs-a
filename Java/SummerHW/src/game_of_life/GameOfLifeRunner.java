package game_of_life;
import java.util.*;
public class GameOfLifeRunner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner in = new Scanner(System.in);

		System.out.println("Welcome to the most basic Game of Life! Try it right here, on the console! Fun!");

		boolean done = false;
		GAME_LOOP: while (!done) {
			GameOfLife game = new GameOfLife();

			// ask user for starting board
			boolean valid = false;
			while (!valid) {
				System.out.println("Start with a basic formation:");
				System.out.println("Glider (G)");
				System.out.println("Blinker (B)");
				System.out.println("Beehive (Bh)");

				String input = in.nextLine();
				if (input.equalsIgnoreCase("glider") || input.equalsIgnoreCase("g")) {
					game.toggleCell(1, 1);
					game.toggleCell(2, 2);
					game.toggleCell(3, 2);
					game.toggleCell(3, 1);
					game.toggleCell(3, 0);

					valid = true;
				}
				else if (input.equalsIgnoreCase("blinker") || input.equalsIgnoreCase("b"))
				{
					game.toggleCell(10, 9);
					game.toggleCell(10, 10);
					game.toggleCell(10, 11);

					valid = true;
				}
				else if (input.equalsIgnoreCase("beehive") || input.equalsIgnoreCase("bh"))
				{
					game.toggleCell(9, 9);
					game.toggleCell(8, 10);
					game.toggleCell(8, 11);
					game.toggleCell(9, 12);
					game.toggleCell(10, 10);
					game.toggleCell(10, 11);

					valid = true;
				}
				else {
					System.out.println("Please enter a valid input.");
				}
			}


			// ask user for next action
			boolean cont = true;
			valid = false;
			do {
				System.out.println(game);
				System.out.println("Do something: Next Generation (N), Reset (R), Quit (Q)");
				String input = in.nextLine();

				// next generation
				if (input.equalsIgnoreCase("next") || input.equalsIgnoreCase("n")) {
					valid = true;
					game.next();
				}
				// reset the game board
				else if (input.equalsIgnoreCase("reset") || input.equalsIgnoreCase("r")) {
					valid = true;
					cont = false;
					continue GAME_LOOP;
				} else if (input.equalsIgnoreCase("quit") || input.equalsIgnoreCase("q")) {
					valid = true;
					cont = false;
					done = true;
				}
				else {
					System.out.println("Please enter a valid input.");
				}
			}
			while (!valid || cont);
		}
			
	}

}
