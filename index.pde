//Mobile version of Run-Away game.

int goodX = 0;
int goodY = 0;
 int enX = 400;
 int enY = 400;
int score = 0;
int prompt = 0;

void reset()
{
  goodX = 0;
  goodY = 0;
  enX = 400;
  enY = 400;
  score = 0;
}

void drawCanvas()
{
  noFill();
  for(int i = 0; i < 500; i+= 100)
  {
     for(int j = 0; j < 500; j+= 100)
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
    rect(400,400,100,100); 
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
  return ((d == 0 & enY > 0) || (d == 1 & enY < 400) || (d == 2 & enX > 0) || (d == 3 & enX < 400));
}
void setup()
{
  size(500,500);
  //noFill();
  drawCanvas();
  drawTiles();
  textSize(20);
}

void draw()
{
  
}
   
  
void touchMove(TouchEvent touchEvent)
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
  
  int x = touchEvent.touches[0].offsetX;
  int y = touchEvent.touches[0].offsetY;
  

   fill(128);
   rect(250,0,20,20);
   rect(0,250,20,20);
   rect(250,480,20,20);
   rect(480,250,20,20);
  
  if((x>250 & x < 270) & (y > 0 & y < 20) & goodY > 0)
  {
    goodY -=100;
  } else if((x>250 & x < 270) & (y > 480 & y < 500) & goodY < 400)
  {
    goodY += 100;
  } else if((x>0 & x < 20) & (y > 250 & y < 270) & goodX > 0)
  {
    goodX -= 100;
  } else if((x>480 & x < 500) & (y > 250 & y < 270) & goodX <400)
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
