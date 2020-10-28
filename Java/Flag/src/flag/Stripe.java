package flag;


import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;

public class Stripe {

	private Color c_fill;
	private Color c_outline;
	private double width;
	private double height;
	private double x;
	private double y;

	public Stripe(double x, double y, double width, double height, Color c_fill, Color c_outline) {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.c_fill = c_fill;
		this.c_outline = c_outline;
	}

	public void draw(Graphics2D g2) {
		Rectangle2D.Double stripe = new Rectangle2D.Double(x, y, width, height);
		g2.setColor(c_fill);
		g2.fill(stripe);
		g2.setColor(c_outline);
		g2.draw(stripe);
	}

	public void translate(double deltaX, double deltaY) {
		this.x += deltaX;
		this.y += deltaY;
	}

	public void setFillColor(Color newC) {
		this.c_fill = newC;
	}

}
