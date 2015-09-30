int goodX = 0;
int goodY = 0;
 int enX = 300;
 int enY = 300;
int score = 0;
int prompt = 0;

void reset()
{
  goodX = 0;
  goodY = 0;
  enX = 300;
  enY = 300;
  score = 0;
}

void drawCanvas()
{
  noFill();
  for(int i = 0; i < 400; i+= 100)
  {
     for(int j = 0; j < 400; j+= 100)
    {
      rect(i,j,100,100);
    }
  }
}

void drawTiles()
{
    fill(0,255,0);
    rect(0,0,100,100);
    fill(255,0,0);
    rect(300,300,100,100); 
 }
boolean canGo(int d)
{
  /*
  Cases:
  1. d == 0 (up) AND enY > 0
  2. d == 1 (down) AND enY < 300
  3. d == 2 (left) AND enX > 0
  4. d == 3 (right) AND enX < 300
  */
  return ((d == 0 & enY > 0) || (d == 1 & enY < 300) || (d == 2 & enX > 0) || (d == 3 & enX < 300));
}
void setup()
{
  size(400,400);
  //noFill();
  drawCanvas();
  drawTiles();
  textSize(20);
}

void draw()
{
  
}
   
  
void keyPressed()
{
  
  background(200);
  drawCanvas();
  
  if(prompt == 1)
  {
     reset();
     drawTiles();
     prompt = 0;
     return;
   }
  
  if(keyCode == UP & goodY > 0)
  {
    goodY -=100;
  } else if(keyCode == DOWN & goodY < 300)
  {
    goodY += 100;
  } else if(keyCode == LEFT & goodX > 0)
  {
    goodX -= 100;
  } else if(keyCode == RIGHT & goodX <300)
  {
    goodX += 100;
  }
  int d = 0;
  //Enemy 0,1,2,3
  d = int(random(4));
   while(!canGo(d))
   {
     d = int(random(4));
   }
   
  
  if(d == 0)
  {
    enY -= 100;
  } else if(d == 1)
  {
    enY += 100;
  } else if(d == 2)
  {
    enX -=100;
  } else if(d == 3)
  {
    enX += 100;
  }
  fill(0,255,0);
  rect(goodX,goodY,100,100);
  fill(255,0,0);
  //print(enX);
  rect(enX,enY,100,100);
  
  fill(0,0,255);
  
  if(dist(enX,enY,goodX,goodY) <= 100*sqrt(2))
  {
    text("Game over!", 20,20);
    text("Press any key to continue.....",20,60);
    prompt = 1;
  }
  text("Your score: " + str(score), 20,40);
  
  score++;
}
