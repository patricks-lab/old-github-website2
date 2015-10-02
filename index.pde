int goodX = 0;
int goodY = 0;
// int enX = 400;
// int enY = 400;
int enX,enY;
int score = 0;
int prompt = 0;

int gridSize = 400;


void setGrid(int size)
{
   gridSize = size;
   size(gridSize,gridSize);
}

void reset()
{
  goodX = 0;
  goodY = 0;
  enX = gridSize-100;
  enY = gridSize-100;
  score = 0;
}

void drawCanvas()
{
  noFill();
  for(int i = 0; i < gridSize; i+= 100)
  {
     for(int j = 0; j < gridSize; j+= 100)
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
    rect(gridSize-100,gridSize-100,100,100); 
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
  return ((d == 0 & enY > 0) || (d == 1 & enY < gridSize-100) || (d == 2 & enX > 0) || (d == 3 & enX < gridSize-100));
}
void setup()
{
   //Get the size of my grid!
   //var e = document.getElementById("gSize");
   //gridSize = e.options[e.selectedIndex].value;
   
  size(gridSize,gridSize);
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
  

   //fill(128);
   //rect(gridSize/2,0,20,20);
   //rect(0,gridSize/2,20,20);
   //rect(250,250,20,20);
   //rect(gridSize/2,gridSize-20,20,20);
   //rect(gridSize-20,gridSize/2,20,20);
   
  
  if(keyCode == UP & goodY > 0)
  {
    goodY -=100;
  } else if(keyCode == DOWN & goodY < gridSize-100)
  {
    goodY += 100;
  } else if(keyCode == LEFT & goodX > 0)
  {
    goodX -= 100;
  } else if(keyCode == RIGHT & goodX <gridSize-100)
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
