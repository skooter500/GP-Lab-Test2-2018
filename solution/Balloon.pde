class Balloon
{
  PVector pos;
  float w;
  float speed;
  color c;
  float halfW;
  
  Balloon()
  {
    reset();
  }
  
  void reset()
  {
    pos = new PVector(random(w, width - w), height + w);
    c = colors[(int) random(0, colors.length)];
    speed = random(1, 3);
    w = random(50, 80);
    halfW = w / 2;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noStroke();
    fill(c);
    ellipse(0, 0, w, w);
    stroke(0);
    line(0, halfW, 0, w);
    line(0, halfW, -5, halfW + 5);
    line(0, halfW, 5, halfW + 5);
    popMatrix();
  }
  
  boolean popped(float x, float y, color c)
  {
    float d = dist(x, y, pos.x, pos.y);
    return (c == this.c && d < halfW); 
  }
  
  void update()
  {
    pos.y -= speed;
    pos.x += random(-2, 2);
    if (pos.x < w)
    {
      pos.x = w;
    }
    if (pos.x > width - w)
    {
      pos.x = width - w;
    }
    if (pos.y < -w)
    {
      reset();
    }
  }
}