int dimension=6;
int circSize=12;
float hx;
float hy;
float inc;
float hue;
int maxheight=500;
float actualHue;

void setup() {
  size(600, 600, P3D);
  colorMode(HSB);

  ellipseMode(CENTER);
  hx=0;
  hy=0;
  inc=0;
  noStroke();
  actualHue=0;
  hue=0;
}

void draw() {
  inc+=.23;
  hue+=-10;
  background(0);

  fill(255);
  translate(300, 0, -750);
  rotateX(radians(60));
  for (int x=-width/2; x<width/2; x+=dimension) {
    actualHue=hue;


    for (int y=-height/2; y<height/2; y+=dimension) {
      pushMatrix();

      actualHue+=1;
  
      float yheight=map(noise(x/dimension/10.0, y/dimension/10.0-inc), 0, 1, -maxheight, 0);
      translate(0, 0, yheight);
      float alpha=map(yheight, -maxheight, 0, -60, 300);
float newcircSize=map(yheight,-maxheight,0,-20,40);
      fill(120, 255, 255, alpha);
      if(newcircSize>0){
      ellipse(x*dimension, y*dimension, newcircSize, newcircSize);
      }

      popMatrix();
    }
  }

  saveFrame("frames/####.png");
}
