import processing.sound.*;

SoundFile sound;
int playerx = 300;
int playery = 500;
int playerxd = 0, playeryd = 0;
int lazerx = playerx, lazery = playery, lazerSPD = 0;
int bubble1x = 30, bubble1y = 44;
int bubble2x = 20, bubble2y = 117;
int bubble3x = 40, bubble3y = 350;
int bubble4x = 60, bubble4y = 25;
int bubble5x = 80, bubble5y = 255;
int bubble1spd = 4, bubble2spd = 7, bubble3spd = 6, bubble4spd = 8, bubble5spd = 9;

int size = 50;
int score = 0;
boolean Gameover = false;
boolean bubble1 = true, bubble2 = true, bubble3 = true, bubble4 = true, bubble5 = true;

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
    rect(lazerx, lazery, 4, 25);
    playerx += playerxd;
    lazerx = playerx;
    lazery += lazerSPD;
    if(lazery < 0){
     lazerx = playerx;
     lazery = playery;
     lazerSPD = 0;
    }
  
    if(bubble1 == true){
      fill(#9CFCEF);
      ellipse(bubble1x, bubble1y, size, size);
      bubble1x += bubble1spd;
    } 
    
    if(bubble2 == true){
      fill(#D59CFC);
      ellipse(bubble2x, bubble2y, size, size);
      bubble2x += bubble2spd;
    } 
    
    if(bubble3  == true){
      fill(#B0FC9C);
      ellipse(bubble3x, bubble3y, size, size);
      bubble3x += bubble3spd;
    } 
    
    if(bubble4 == true){
      fill(#FCC19C);
      ellipse(bubble4x, bubble4y, size, size);
      bubble4x += bubble4spd;
    } 
    
    if(bubble5 == true){
      fill(#F6FC9C);
      ellipse(bubble5x, bubble5y, size, size);
      bubble5x += bubble5spd;
    } 
    
   if(bubble1x > 600 || bubble1x < 0){
    bubble1spd = - bubble1spd; 
    }  
   if(bubble2x > 600 || bubble2x < 0){
      bubble2spd = - bubble2spd;
    } 
   if(bubble3x > 600 || bubble3x < 0){
       bubble3spd = - bubble3spd; 
    } 
   if(bubble4x > 600 ||bubble4x < 0){
       bubble4spd = - bubble4spd; 
    } 
   if(bubble5x > 600 || bubble5x < 0){
       bubble5spd = - bubble5spd; 
    }
 
   if(bubble1 == true){
     if (lazerx > bubble1x && lazerx < bubble1x + 25 && lazery < bubble1y){
        bubble1 = false;
        score = score + 1;
      }
  }
 
  if(bubble2 == true){
    if (lazerx > bubble2x && lazerx < bubble2x + 25 && lazery < bubble2y){
     score = score + 1;
     bubble2 = false;
    }  
  }
  
  if(bubble3 == true){
    if (lazerx > bubble3x && lazerx < bubble3x + 25 && lazery < bubble3y){
    bubble3 = false;
    score = score + 1;
    }
  }
  
 if(bubble4 == true){
  if(lazerx > bubble4x && lazerx < bubble4x + 25 && lazery < bubble4y){
  bubble4 = false;
  score = score + 1;
  }
 }
 
 if(bubble5 == true){
  if(lazerx > bubble5x && lazerx < bubble5x + 25 && lazery < bubble5y){
   bubble5 = false;
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
