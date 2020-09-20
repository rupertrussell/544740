// https://www.openprocessing.org/sketch/544740
// 2D Perlin noise - rotation by nsiddh3 
// fork by Rupert Russell 21 September 2020

float xstart, xnoise, ynoise;
int scale = 25;
int margin = 100;

void setup() {
  noLoop();
  strokeWeight(3);
  size(3000, 3000);
  smooth();
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y=margin; y<=height - margin; y+=scale) {
    ynoise+=0.1;
    xnoise = xstart;
    for (int x=margin; x<=width - margin - scale; x+=scale) {  
      xnoise+=0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
    save("noise.png");
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(90));
  stroke(0);
  line(0, 0, scale * 1.2, 0);
  popMatrix();

}
