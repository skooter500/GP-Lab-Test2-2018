class Button
{
  PVector pos;
  float w;
  color c;
  
  Button(float x, float y, float w, color c)
  {
    pos = new PVector(x, y);
    this.w = w;
    this.c = c;
  }
  
  void render()
  {
    noStroke();
    fill(c);
    rect(pos.x, pos.y, w, w);
  }
  
  boolean clicked(float x, float y)
  {
    return (x >= pos.x && y >= pos.y && x < pos.x + w && y < pos.y + w);
  }
}