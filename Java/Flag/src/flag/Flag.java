package flag;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;

import javax.swing.JApplet;

public class Flag extends JApplet {

	private final int STRIPES = 13;

// SCALE FACTORS (A through L)

	private final double A = 1.0; // Hoist (width) of flag

	private final double B = 1.9; // Fly (length) of flag

	private final double C = 0.5385; // Hoist of Union

	private final double D = 0.76; // Fly of Union

	private final double E = 0.054; // y-distance from top left of flag to center of star

	private final double F = 0.054; // y-distance between center of stars

	private final double G = 0.063; // x-distance from top left of flag to center of star

	private final double H = 0.063; // x-distance between center of stars

	private final double K = 0.0616; // Diameter of star

	private final double L = 0.0769; // Width of stripe

// You will need to set values for these in paint()

	private double flag_width; // width of flag in pixels

	private double flag_height; // height of flag in pixels

	private double stripe_height; // height of an individual stripe in pixels

// init() will automatically be called when an applet is run

	public void init() {

		setSize(760, 400);
		repaint();
	}

	public void paint(Graphics g) {
		Graphics2D g2 = (Graphics2D) g;
		this.removeAll();

		double window_width = this.getWidth();
		double window_height = this.getHeight();

		if (window_width < window_height * 1.9) {
			flag_width = window_width;
			flag_height = flag_width / 1.9;
		} else {
			flag_height = window_height;
			flag_width = 1.9 * flag_height;
		}

		/*
		 * flag_width = 760; flag_height = 400;
		 */
		stripe_height = L * flag_height;

		drawBackground(g2);
		drawStripes(g2);
		drawField(g2);
		drawStars(g2);
	}

	private void drawBackground(Graphics2D g2) {

		Rectangle2D.Double background = new Rectangle2D.Double(0, 0, this.getWidth(), this.getHeight());
		g2.setColor(Color.white);
		g2.fill(background);

	}

	public void drawStripes(Graphics2D g2) {

		Stripe s = new Stripe(0, 0, flag_width, stripe_height, Color.black, Color.black);
		// draw 13 stripes
		for (int i = 0; i < 13; i++) {
			s.setFillColor((i % 2 == 0) ? Color.red : Color.white);
			s.draw(g2);
			s.translate(0, stripe_height);
		}
	}

	public void drawField(Graphics2D g2) {
		Rectangle2D.Double field = new Rectangle2D.Double(0, 0, flag_height * D, flag_height * C);
		g2.setColor(Color.blue);
		g2.fill(field);
		g2.setColor(Color.black);
		g2.draw(field);

	}

	public void drawStars(Graphics2D g2) {

		final double outer_radius = (K * flag_height) / 2;
		final double x = G * flag_height;
		final double y = E * flag_height;
		final double x_spacing = H * flag_height;
		final double y_spacing = F * flag_height;

		Star s = new Star(outer_radius, x, y, Color.white, Color.black);

		for (int i = 0; i < 9; i++) {

			s.setX(x);

			// 5 stars per row
			if (i % 2 == 1) {
				s.translate(x_spacing, 0);
			}

			for (int j = 0; j < (i % 2 == 0 ? 6 : 5); j++) {
				s.draw(g2);
				s.translate(x_spacing * 2, 0);

			}
			s.translate(0, y_spacing);

		}
	}

}
