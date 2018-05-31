void setup()
{
  size(1000, 1000);
  b = new Balloon();
  noCursor();
  strokeWeight(2);
  setupButtons();
}

color[] colors = { color(255, 0, 0), color(0, 255, 0), color(0, 0, 255) } ;
Button[] buttons = new Button[colors.length];

Balloon b;
color pinColor = colors[0];

int score = 0;

void drawPin()
{
  stroke(pinColor);
  line(mouseX, mouseY, mouseX + 5, mouseY + 5);
  noFill();
  ellipse(mouseX + 7, mouseY + 7, 5, 5);
}

void setupButtons()
{
  float x = width - 60;
  float size = 50;
  float gap = 20;
  for(int i = 0 ; i < colors.length ; i ++)
  {
    float y = 50 + (i * (size + gap));
    buttons[i] = new Button(x, y, size, colors[i]);
  }
}

void drawScore()
{
  fill(0);
  textSize(24);
  text("Score: " + score, 50, 50);
}

void mousePressed()
{
  for(Button b:buttons)
  {
    if (b.clicked(mouseX, mouseY))
    {
      pinColor = b.c;
    }
  }
  checkForPop();
}

void checkForPop()
{
  if (b.popped(mouseX, mouseY, pinColor))
  {
    b.reset();
    score ++;
  }
}

void draw()
{
  background(255);
  b.update();
  b.render();
  
  for(Button b:buttons)
  {
    b.render();
  }
  drawPin();  
  drawScore();
}