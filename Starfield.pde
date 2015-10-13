
Particle stars[] = new Particle[100];
double starSpeed, starDirection, starX, starY, starSize;
void setup()
{
	frameRate(20);
	background(0);
	size(800, 800);

	for(int i = 0; i < 98; i++)
		stars[i] = new NormalParticle();
	stars[98] = new OddballParticle();
	stars[99] = new JumboParticle();
}

void draw()
{
	background(0);
	for(int i = 0; i < stars.length; i++)
		{
			stars[i].show();
			stars[i].move();
			stars[i].reset();
		}
}

class NormalParticle implements Particle
{

	double starSpeed, starDirection, starX, starY, starSize, planetSize, resetPoint;
	int colorPoint1, colorPoint2, colorPoint3;
	NormalParticle()
	{
		starDirection = 2 * Math.PI * Math.random();
		starSpeed = Math.random() * 5 + 4;
		starX = 400;
		starY = 400;
		starSize = 2;
		planetSize = 0;
		resetPoint = 0;
		colorPoint1 = (int)(Math.random() * 255);
		colorPoint2 = (int)(Math.random() * 255);
		colorPoint3 = (int)(Math.random() * 255);

	}
	public void show()
	{
		noStroke();
		fill(255);
		//fill((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255) );
		ellipse((float)starX, (float)starY, (float)starSize, (float)starSize);
	}
	public void move()
	{
		starX += Math.cos(starDirection) * starSpeed;
		starY += Math.sin(starDirection) * starSpeed;
		starSize += planetSize;
	}
	public void reset()
	{
		if(starX < (0 - resetPoint) || starX > (800 + resetPoint))
		{
			starY = 400;
			starX = 400;
			starDirection = 2 * Math.PI * Math.random();
			starSize = 2;
			colorPoint1 = (int)(Math.random() * 255);
			colorPoint2 = (int)(Math.random() * 255);
			colorPoint3 = (int)(Math.random() * 255);
		}
		if(starY < (0 - resetPoint) || starY > (800 + resetPoint))
		{
			starX = 400;
			starY = 400;
			starDirection = 2 * Math.PI * Math.random();
			starSize = 2;
			colorPoint1 = (int)(Math.random() * 255);
			colorPoint2 = (int)(Math.random() * 255);
			colorPoint3 = (int)(Math.random() * 255);
		}
	}
}
interface Particle
{
	public void show();
	public void move();
	public void reset();
}
class OddballParticle implements Particle
{
	public void show() {
		noStroke();
		fill(200, 200, 200);
		rotate(45);
		rect((float)starX, (float)starY, 20, 10);
		ellipse((float)starX, (float)starY , 10, 10);
		ellipse((float)starX, (float)starY + 10 , 10, 10);
		rotate(-45);

	}
	public void move() {
		starX += (int)(Math.random() * 3);
		starY += (int)(Math.random() * 2 - 1.5);
	}
	public void reset() {
		if(starX > 400)
		{
			starX = -20;
			starY = -20;
		}
	}
}
class JumboParticle extends NormalParticle{
	JumboParticle(){
		starSize = 5;
		planetSize = 0.8;
		starSpeed = (Math.random() * 4 + 3);
		resetPoint = 200;

	}
	public void show() {
		noStroke();
		fill(colorPoint1, colorPoint2, colorPoint3);
		ellipse((float)starX, (float)starY, (float)starSize, (float)starSize);
	}
}

