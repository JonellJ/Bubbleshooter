import processing.sound.*;

SoundFile sound;
int playerx = 300;
int playery = 500;
int playerxd = 0, playeryd = 0;
int lazerx = playerx, lazery = playery, lazerSPD = 0;
int ball1x = 30, ball1y = 44;
int ball2x = 20, ball2y = 117;
int ball3x = 40, ball3y = 350;
int ball4x = 60, ball4y = 25;
int ball5x = 80, ball5y = 255;
int ball1spd = 4, ball2spd = 7, ball3spd = 6, ball4spd = 8, ball5spd = 9;

int size = 50;
int score = 0;
boolean Gameover = false;
boolean ball1 = true, ball2 = true, ball3 = true, ball4 = true, ball5 = true;

welcome welcomeclass;
congrats congratsclass;

PImage pic2;
PImage pic3;


void setup(){
 background(#C1E8FF);
  size(600, 600);
  pic2 = loadImage("background.png");
  background(pic2);
  pic3 = loadImage("congrats.png");
  background(pic3);
  congratsclass = new congrats();
  welcomeclass = new welcome();
  welcomeclass.welcomedisplay();
  sound = new SoundFile(this, "gamemusic.mp3");
  sound.play();
}


void draw(){
  frameRate(85);
  if(Gameover == false){
    background(#C1E8FF);
    fill(#D57AFC);
    textSize(35);
    text("SCORE: " + score, 25, 520);
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
      ball1x += ball1spd;
    } 
    
    if(ball2 == true){
      fill(#D59CFC);
      ellipse(ball2x, ball2y, size, size);
      ball2x += ball2spd;
    } 
    
    if(ball3  == true){
      fill(#B0FC9C);
      ellipse(ball3x, ball3y, size, size);
      ball3x += ball3spd;
    } 
    
    if(ball4 == true){
      fill(#FCC19C);
      ellipse(ball4x, ball4y, size, size);
      ball4x += ball4spd;
    } 
    
    if(ball5 == true){
      fill(#F6FC9C);
      ellipse(ball5x, ball5y, size, size);
      ball5x += ball5spd;
    } 
    
   if(ball1x > 600 || ball1x < 0){
     ball1spd = - ball1spd; 
    }  
   if(ball2x > 600 || ball2x < 0){
      ball2spd = - ball2spd;
    } 
   if(ball3x > 600 || ball3x < 0){
       ball3spd = -ball3spd; 
    } 
   if(ball4x > 600 || ball4x < 0){
       ball4spd = - ball4spd; 
    } 
   if(ball5x > 600 || ball5x < 0){
       ball5spd = - ball5spd; 
    }
 
   if(ball1 == true){
     if (lazerx > ball1x && lazerx < ball1x + 25 && lazery < ball1y){
        ball1 = false;
        score = score + 1;
      }
  }
 
  if(ball2 == true){
    if (lazerx > ball2x && lazerx < ball2x + 25 && lazery < ball2y){
     score = score + 1;
     ball2 = false;
    }  
  }
  
  if(ball3 == true){
    if (lazerx > ball3x && lazerx < ball3x + 25 && lazery < ball3y){
    ball3 = false;
    score = score + 1;
    }
  }
  
 if(ball4 == true){
  if(lazerx > ball4x && lazerx < ball4x + 25 && lazery < ball4y){
  ball4 = false;
  score = score + 1;
  }
 }
 
 if(ball5 == true){
  if(lazerx > ball5x && lazerx < ball5x + 25 && lazery < ball5y){
   ball5 = false;
   score = score + 1;
  }
 }
 if(score == 5){
   Gameover = true;
 } 
 
 if(Gameover == true){ 
   congratsclass.congratsdisplay();
    }
  }
}

void keyReleased(){
 playerxd = 0;
 playeryd = 0;
}

void keyPressed(){
 if(keyCode == RIGHT){
   playerxd = 6;
 }else if(keyCode == LEFT){
  playerxd = - 6; 
 }else if(keyCode == UP){
 lazerSPD = - 35;
 }
}
