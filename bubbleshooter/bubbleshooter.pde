int playerx = 300;
int playery = 500;
int playerxd = 1, playeryd = 0;
int lazerx = playerx, lazery = playery, lazerSPD = 0;
int ball1x = 30, ball1y = 44;
int ball2x = 20, ball2y = 117;
int ball3x = 40, ball3y = 350;
int ball4x = 60, ball4y = 25;
int ball5x = 80, ball5y = 255;
int ball6x = 100, ball6y = 169;
int ball7x = 120, ball7y = 125;
int ball8x = 140, ball8y = 400;
int ball9x = 160, ball9y = 336;
int ball10x = 180, ball10y = 200;
int ball1s = 4, ball2s = 7, ball3s = 6, ball4s = 8, ball5s = 9;
int size = 50;
int mode;
boolean ball1 = true, ball2 = true, ball3 = true, ball4 = true, ball5 = true;
//PImage background;
welcome welcomeclass;


void setup(){
  size(600, 600);
  background(#C1E8FF);
  welcomeclass = new welcome();
  mode = 1;
}


void draw(){
  if(mode == 1){
    welcomeclass.welcomedisplay();
  }else if(mode == 2){
  background(#C1E8FF);
  fill(#FFD8FD);
  rect(playerx, playery, 25, 50);
  fill(#F29CFC);
  rect(lazerx, lazery, 2, 25);
  playerx += playerxd;
  playery += playeryd;
  lazerx = playerx;
  lazery += lazerSPD;
  if(lazery < 0){
   lazerx = playerx;
   lazery = playery;
   lazerSPD = 0;
  }
  
  if(ball1 == true){
  fill(#9CFCEF);
  ellipse(ball1x, ball1y, size, size);
  ball1x += ball1s;
  } 
  if(ball2 == true){
  fill(#D59CFC);
  ellipse(ball2x, ball2y, size, size);
  ball2x += ball2s;
  } 
  if(ball3  == true){
  fill(#B0FC9C);
  ellipse(ball3x, ball3y, size, size);
  ball3x += ball3s;
  } 
  if(ball4 == true){
  fill(#FCC19C);
  ellipse(ball4x, ball4y, size, size);
  ball4x += ball4s;
  } 
  if(ball5 == true){
  fill(#F6FC9C);
  ellipse(ball5x, ball5y, size, size);
  ball5x += ball5s;
  } 

  
 if(ball1x > 600 || ball1x < 0){
   ball1s = - ball1s; 
    }  
 if(ball2x > 600 || ball2x < 0){
    ball2s = - ball2s;
    } 
 if(ball3x > 600 || ball3x < 0){
     ball3s = -ball3s; 
    } 
 if(ball4x > 600 || ball4x < 0){
     ball4s = - ball4s; 
    } 
 if(ball5x > 600 || ball5x < 0){
     ball5s = - ball5s; 
    }
  
      
 if (lazerx > ball1x && lazerx < ball1x + 25 && lazery < ball1y){
    ball1 = false;
    ball1s = 0;
  }
   if (lazerx > ball2x && lazerx < ball2x + 25 && lazery < ball2y){
    ball2 = false;
    ball2s = 0;
  }
   if (lazerx > ball3x && lazerx < ball3x + 25 && lazery < ball3y){
    ball3 = false;
    ball3s = 0;
  }
  if(lazerx > ball4x && lazerx < ball4x + 25 && lazery < ball4y){
  ball4 = false;
  ball4s = 0;
  }
  if(lazerx > ball5x && lazerx < ball5x + 25 && lazery < ball5y){
   ball5 = false;
   ball5s = 0;
  }
}
}

void keyReleased(){
 playerxd = 0;
 playeryd = 0;
}

void keyPressed(){
 if(keyCode == RIGHT){
   playerxd = 5;
 }else if(keyCode == LEFT){
  playerxd = - 5; 
 }else if(keyCode == UP){
 lazerSPD = - 35;
 }
}
