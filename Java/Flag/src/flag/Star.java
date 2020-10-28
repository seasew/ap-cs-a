package flag;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Polygon;

public class Star {

	private double outer_radius;

	// center coordinates of star
	private double x;
	private double y;
	private Color c_fill;
	private Color c_outline;

	public Star(double outer_radius, double x, double y, Color c_fill, Color c_outline) {
		this.outer_radius = outer_radius;
		this.x = x;
		this.y = y;
		this.c_fill = c_fill;
		this.c_outline = c_outline;
	}

	public void draw(Graphics2D g2) {
		double angle = -90;
		final double inner_radius = 0.382 * outer_radius;

		int[] starX = new int[10];
		int[] starY = new int[10];
		for (int i = 0; i < 10; i++) {
			double newX = x + (Math.cos(Math.toRadians(angle)) * (i % 2 == 0 ? outer_radius : inner_radius));
			double newY = y + (Math.sin(Math.toRadians(angle)) * (i % 2 == 0 ? outer_radius : inner_radius));
			starX[i] = (int) Math.round(newX);
			starY[i] = (int) Math.round(newY);
			angle += 360 / 10;
		}

		Polygon p = new Polygon(starX, starY, 10);
		g2.setColor(c_outline);
		g2.draw(p);
		g2.setColor(c_fill);
		g2.fill(p);

	}

	public void translate(double deltaX, double deltaY) {
		this.x += deltaX;
		this.y += deltaY;
	}

	public void setX(double newX) {
		this.x = newX;
	}

}
