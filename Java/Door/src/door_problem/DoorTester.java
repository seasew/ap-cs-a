package door_problem;

public class DoorTester {

	public static final int COUNT = 100;
	private static boolean[] doors = new boolean[COUNT];

	public static void main(String[] args) {
		for (int d = 0; d < COUNT; d++) {
			for (int p = 1; p <= COUNT; p++) {
				if ((d + 1) % p == 0) {
					// toggle the door
					doors[d] = !doors[d];
				}
			}
		}

		for (int i = 0; i < COUNT; i++) {
			if (doors[i]) {
				System.out.println("Door " + (i + 1) + ": Open");
			}
		}

	}

	private static void checkDoor(int id, int person) {

	}

}
