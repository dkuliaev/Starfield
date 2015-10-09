
Particle stars[] = new Particle[200];
double starSpeed, starDirection, starX, starY, starSize;
void setup()
{
	background(0);
	size(800, 800);

	for(int i = 1; i < 200; i++)
		stars[i] = new NormalParticle();
	stars[0] = new OddballParticle();
	stars[1] = new JumboParticle();
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

	double starSpeed, starDirection, starX, starY, starSize, planetSize;
	NormalParticle()
	{
		starDirection = 2 * Math.PI * Math.random();
		starSpeed = Math.random() * 15 + 10;
		starX = 400;
		starY = 400;
		starSize = 2;
		planetSize = 10;

	}
	public void show()
	{
		noStroke();
		fill(255);
		ellipse((float)starX, (float)starY, (float)starSize, (float)starSize);
		fill(200, 200, 225);
		ellipse(400, 400, (float)planetSize, (float)planetSize);
	}
	public void move()
	{
		starX += Math.cos(starDirection) * starSpeed;
		starY += Math.sin(starDirection) * starSpeed;
		starSpeed += .0001;
	
	}
	public void reset()
	{
		if(starX < 0 || starX > 800)
		{
			starY = 400;
			starX = 400;
			starDirection = 2 * Math.PI * Math.random();
		}
		if(starY < 0 || starY > 800)
		{
			starX = 400;
			starY = 400;
			starDirection = 2 * Math.PI * Math.random();
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
		fill(255, 0, 0);
		ellipse((float)starX, (float)starY , 10, 10);
	}
	public void move() {
		starX += (int)(Math.random() * 1.5);
		starY += (int)(Math.random() * 1.5);
	}
	public void reset() {}
}
class JumboParticle extends NormalParticle{
	JumboParticle(){
		starSize = 20;
	}
	
}

