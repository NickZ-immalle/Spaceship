//tekst
PFont tekstType;

//Basics zodat het spel fundamenteel werkt
ArrayList<kogel> kogels = new ArrayList<kogel>();
int count = 0;
int lives = 0;
int counter = 0;
int score = 0;
Fly[] asteroid = new Fly [10];

//Ruimteship png
PImage img;
int imgX = 600;
int imgY = 627;

void setup(){
  size(1200,1200, P3D);
  background(0);
  smooth();
  frameRate(30);
  tekstType = createFont("Cambria", 32);
  img = loadImage("Spaceship.png");
  imageMode(CENTER);
  
  //Asteroids aanmaken
   for(int i = 0; i< asteroid.length; i++){
    asteroid[i] = new Fly();
   }
}

void draw(){
  clear();
  imgX = 600;
  imgY = 600;
  tekst();
  points();
  int i;
  float angle = atan2(mouseY -600, mouseX - 600);
  pushMatrix();
  translate(600, 600);
  rotate(angle);
  image(img,0, 0, 30, 70);
  popMatrix();
  for (i = 0; i<kogels.size(); i++){
    kogel k = kogels.get(i);
    if(k.update()){
      kogels.remove(i);
    }
  }
  
  //Asteroid laten gaan en zien
  for(i = 0; i< asteroid.length; i++){
    asteroid[i].fall();
    asteroid[i].show();
 }
}

class Fly
{
  
  float x = random(width);
  float y = random(-600, -100);
  float yspeed = random(0.5,2.2);
  int diameter = 40;
  color c;
  
  void fall()
  {
    y = y + yspeed;
    
  }
  
  void show()
  {
    c = color(#544225);
   
   stroke(c);
   strokeWeight(2);
   
   ellipse(x,y,diameter,diameter);
 }
 
}

void tekst(){
  textFont(tekstType, 20);
  fill(0, 255);
  text("Asteriods by Nick Zegels", 30, 30);
  textFont(tekstType, 20);
  fill(255);
  text("Asteriods by Nick Zegels", 30, 30);
}


void mousePressed() {
  if(mouseButton == LEFT){
    float angle = atan2(mouseY - 600, mouseX - 600);
    kogels.add(new kogel(angle, 2));
  }
}

void points(){
  stroke(255);
  point(30, 145, -10);
  point(300, 75, -50);
  point(450, 555, -50);
  point(120, 875, -40);
  point(690, 705, -50);
  point(780, 230, -30);
  point(250, 600, -20);
  point(530, 350, -50);
  point(610, 250, -30);
  point(130, 15, -10);
  point(350, 705, -50);
  point(400, 145, -50);
  point(220, 675, -40);
  point(600, 455, -50);
  point(780, 350, -30);
  point(270, 60, -20);
  point(460, 300, -50);
  point(910, 150, -30);
}

class kogel {
  float angle, speed;
  float position;

  kogel(float _angle, float _speed) {
    angle = _angle;
    speed = _speed + 1;
    position = 0;
  }

  boolean update() {
    position = position + speed;
    pushMatrix();
    translate(600, 600);
    rotate(angle);
    ellipse (position + 20, 0, 5, 5);
    popMatrix();
    if (position>600) {
      return true;
    } else {
      return false;
    }
  }
}
