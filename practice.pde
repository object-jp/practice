class Menu{
  void buttonPrint(){
    if((mouseX>=width/2-170 && mouseX<=width/2+170) && (mouseY>=height/2+220 && mouseY<=height/2+340)){
      fill(128);
    }else{
      fill(255);
    }
    strokeWeight(5);
    rect(width/2-170,height/2+220,340,120);
  }
  
  void wordPrint(){
    textAlign(CENTER,CENTER);
    fill(0);
    textSize(250);
    text("Game",width/2,height/3);
    textSize(150);
    text("start",width/2,height/3*2);
  }
}

class SetMenu{
  void buttonPrint(){
     if((mouseX>=1360 && mouseX<=1430)&& (mouseY>=390 && mouseY<=460)){
      fill(128);
    }else{
      fill(255);
    }
    rect(1360,390,70,70);
    if((mouseX>=1760 && mouseX<=1830)&& (mouseY>=390 && mouseY<=460)){
      fill(128);
    }else{
      fill(255);
    }
    rect(1760,390,70,70);
    
    if((mouseX>=1360 && mouseX<=1430)&& (mouseY>=590 && mouseY<=660)){
      fill(128);
    }else{
      fill(255);
    }
    rect(1360,590,70,70);
    if((mouseX>=1760 && mouseX<=1830)&& (mouseY>=590 && mouseY<=660)){
      fill(128);
    }else{
      fill(255);
    }
    rect(1760,590,70,70);
    
    if((mouseX>width/2-120 && mouseX<=width/2+110) && (mouseY>=1250 && mouseY<=1400)){
      fill(128);
    }else{
      fill(255);
    }
    rect(width/2-120,1250,230,150);
  }
  
  void wordPrint(){
    textAlign(CENTER,CENTER);
    fill(0);
    textSize(200);
    text("setting",width/2,100);
    textSize(150);
    text("Go",width/2,1300);
    textSize(100); 
    text("residue",750,400);
    text(":",width/2,400);
    text(residue,1600,400);
    text("←",1400,400);
    text("→",1800,400);
    text("number of enemy",700,600);
    text(":",width/2,600);
    text(count3*3,1600,600);
    text("←",1400,600);
    text("→",1800,600);
  }
}

class BattleMenu{
  void print(){
    background(255);
    textAlign(CENTER,CENTER);
    fill(0);
    textSize(50);
    text("residue : ",100,1470);
    text(residue,210,1470);
    text("score : ",100,50);
    text(score,200,50);
  }
}

class EndMenu{
  void wordPrint(){
    textAlign(CENTER,CENTER);
    fill(0);
    textSize(300);
    text("GameOver",width/2,height/2);
    textSize(100);
    text("score : ",width/2,height/3*2);
    text(score,width/2+230,height/3*2);
  }
}

class ResultMenu{
  void print(){
    textAlign(CENTER,CENTER);
    fill(0);
    textSize(300);
    text("CLEAR",width/2,height/2);
    textSize(100);
    text("score : ",width/2,height/3*2);
    text(score,width/2+230,height/3*2);
  }
}

class Myself{
  int x;
  int len=100;
  void print(int dx){
    x=dx;
    fill(124,252,0);
    ellipse(x,1400,len,len);
  }

  boolean hit(int ex, int ey){
    if(dist(x,1400,ex,ey)<=len/2){
      residue-=1;
      return false;
    }
    return true;
  }
}

class Enemy {
  int x, y;
  int hit;
  int enemyWidth;
  boolean active;
  color enemyColor;

  Enemy(int dx, int dy, int hits, color enemyColors, int len) {
    x = dx;
    y = dy;
    hit = hits;
    enemyColor = enemyColors;
    enemyWidth=len;
    active = true;
  }

  void print() {
    if (active) {
      fill(enemyColor);
      rect(x, y, enemyWidth, 60);
      stroke(0);
      if (enemyColor == color(255, 255, 0) && hit == 1) {
        line(x + enemyWidth/2, y, x + enemyWidth/2, y + 60); 
      } else if (enemyColor == color(255, 0, 0)) {
        if (hit == 2) {
          line(x + enemyWidth/2, y, x + enemyWidth/2, y + 60); 
        } else if (hit == 1) {
          line(x, y + 30, x + enemyWidth, y + 30); 
        }
      }
    }
  }

  boolean hit(int bx, int by) {
    if (active && ((by-15>=y && by-15<=y+60) || (by+15>=y && by+15<y+60)) && ((bx-15 >= x && bx-15 <= x + enemyWidth) ||  (bx+15 >= x && bx+15 <= x + enemyWidth))){
      hit--;
      if (hit <= 0) {
        score++;
        active = false;
      }
      return true;
    }
    return false;
  }
  
  
}

class MyBeam{
  void print(){
    for(int i=1;i<num2;i++){
      if(beams[i]){
        fill(255);
        ellipse(beamsX[i],beamsY[i],15,15);
      }
      if(beams[i]){
        beamsY[i]-=10;
      }
    }
  }
}

class EnemyBeam {
  int x, y;
  float speed;
  boolean active;

  EnemyBeam(int dx, int dy, float speeds) {
    x = dx;
    y = dy;
    speed = speeds;
    active = true;
  }

  void print() {
    if (active) {
      fill(255, 0, 0);
      ellipse(x, y, 20, 20); 
      y += speed; 
      if (y > height) {
        active = false; 
      }
      if(!myself.hit(x,y)){
        active = false;
      }
    }
  }
}

class yStar {
  float x, y;
  float size;
  float speed;

  yStar() {
    x = random(width);
    y = random(height);
    size = random(5, 15);
    speed = random(1, 5);
  }

  void move() {
    y += speed;
    if (y > height) {
      y = 0;
      x = random(width);
    }
  }

  void display() {
    fill(255, 255, 0);
    noStroke();
    ellipse(x, y, size, size);
  }
}

class bStar extends yStar{
  bStar(){
    super();
  }
  
  void display(){
    fill(0,0,255);
    noStroke();
    ellipse(x,y,size,size);
  }
}

class rStar extends yStar{
  rStar(){
    super();
  }
  
  void display(){
    fill(255,0,0);
    noStroke();
    ellipse(x,y,size,size);
  }
}

class ClearBackground {
  ArrayList<yStar> ystars;
  ArrayList<bStar> bstars;
  ArrayList<rStar> rstars;

  ClearBackground() {
    ystars = new ArrayList<yStar>();
    bstars = new ArrayList<bStar>();
    rstars = new ArrayList<rStar>();
    for(int i = 0; i < 100; i++){
      ystars.add(new yStar());
      bstars.add(new bStar());
      rstars.add(new rStar());
    }
  }

  void display() {
    for(yStar star : ystars){
      star.move();
      star.display();
    }
    
    for(bStar star : bstars){
      star.move();
      star.display();
    }
    
    for(rStar star : rstars){
      star.move();
      star.display();
    }
  }
}

int myX;
int count1=3;
int count2=0;
int count3=20; //敵の数
int residue=count1;
int judge=1;
int score=0;
int num1=count2;
int num2=1000; //要素数
int[]beamsX=new int[num2];
int[]beamsY=new int[num2];
boolean[]beams=new boolean[num2];
int[] enemyAttackIntervals = {60, 45, 30};
int[] frameCounters = {0, 0, 0};

Menu menu;
SetMenu setmenu;
BattleMenu battlemenu;
EndMenu endmenu;
ResultMenu resultmenu;
Myself myself;
Enemy[][] enemies = new Enemy[3][count3];
MyBeam mybeam;
ArrayList<EnemyBeam> enemyBeams = new ArrayList<EnemyBeam>();
ClearBackground clearBackground;

void setup(){
  fullScreen(); 
  background(255);
  int enemyWidth =1500/count3;
  int spacing = 20;
  int totalEnemies = count3;
  int startX = (width - (totalEnemies * (enemyWidth + spacing))) / 2 + spacing / 2;
  int startY = 100;
  color[] colors = {color(255, 0, 0), color(255, 255, 0), color(0, 0, 255)};
  for(int i=0;i<num2;i++){
    beams[i]=false;
    beamsY[i]=1350;
  }
  menu=new Menu();
  setmenu=new SetMenu();
  battlemenu=new BattleMenu();
  endmenu=new EndMenu();
  resultmenu=new ResultMenu();
  myself=new Myself();
  mybeam=new MyBeam();
  clearBackground = new ClearBackground();
  for (int i = 0; i < count3; i++) {
    enemies[0][i] = new Enemy(startX + i * (enemyWidth + spacing), startY, 3, colors[0],enemyWidth);
    enemies[1][i] = new Enemy(startX + i * (enemyWidth + spacing), startY + 60 + spacing, 2, colors[1],enemyWidth);
    enemies[2][i] = new Enemy(startX + i * (enemyWidth + spacing), startY + 120 + spacing*2, 1, colors[2],enemyWidth);
  }
}

void draw(){ 
  if(judge==1){
    background(255);
    menu.buttonPrint();
    menu.wordPrint();
  }else if(judge==2){
    background(255);
    setmenu.buttonPrint();
    setmenu.wordPrint();
  }else if(judge==3){
    battlemenu.print();
    myX=mouseX;
    frameRate(100);
    myself.print(myX);
    mybeam.print();
    printEnemys();
    printEnemyBeams();
    enemyAttack();
    checkHits();
    checkEnemyCount();
  }else if(judge==4){
    background(255,0,0);
    endmenu.wordPrint();
  }else if(judge==5){
    background(255);
    resultmenu.print();
    clearBackground.display();
  }
  if(residue==0){
    judge=4;
  }
}

void printEnemys(){
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < count3; j++) {
      enemies[i][j].print();
    }
  }
}

void printEnemyBeams() {
  for (int i = enemyBeams.size() - 1; i >= 0; i--) {
    EnemyBeam beam = enemyBeams.get(i);
    beam.print();
    if (!beam.active) {
      enemyBeams.remove(i);
    }
   
  }
}

void enemyAttack() {
  for (int row = 0; row < 3; row++) {
    frameCounters[row]++;
    if (frameCounters[row] >= enemyAttackIntervals[row]) {
      frameCounters[row] = 0;
      for (int col = 0; col < count3; col++) {
        boolean beamExistsInColumn = false;
        for (EnemyBeam beam : enemyBeams) {
          if (beam.active && beam.x == enemies[row][col].x + 30) {
            beamExistsInColumn = true;
            break;
          }
        }
        if (!beamExistsInColumn && enemies[row][col].active) {
          float speed;
          if (row == 0) {
            speed = 20; // Speed 2x
          } else if (row == 1) {
            speed = 15; // Speed 1.5x
          } else {
            speed = 10; // Speed 1x
          }
          enemyBeams.add(new EnemyBeam(enemies[row][col].x + 30, enemies[row][col].y + 60, speed));
          break;
        }
      }
    }
  }
}

void checkHits(){
  for (int i = 1; i < num2; i++) {
    if (beams[i]) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < count3; k++) {
          if (enemies[j][k].hit(beamsX[i], beamsY[i])) {
            beams[i] = false;
          }
        }
      }
    }
  }
}

void checkEnemyCount(){
  int count=0;
  for(int i=0;i<3;i++){
    for(int j=0;j<count3;j++){
      if(enemies[i][j].active){
        count++;
      }
    }
  }
  
  if(count==0){
    judge=5;
  }
}

void mousePressed(){
  if(judge==1){
    if((mouseX>=width/2-170 && mouseX<=width/2+170) && (mouseY>=height/2+220 && mouseY<=height/2+340)){
      judge=2;
    }
  }
  
  if(judge==2){
    if((mouseX>=1360 && mouseX<=1430)&& (mouseY>=390 && mouseY<=460)){
      if(residue!=1){
        residue--;
      }
    }
    if((mouseX>=1760 && mouseX<=1830)&& (mouseY>=390 && mouseY<=460)){
      residue++;
    }
    
    if((mouseX>=1360 && mouseX<=1430)&& (mouseY>=590 && mouseY<=660)){
      if(count3!=1){
        count3--;
      }
    }
    if((mouseX>=1760 && mouseX<=1830)&& (mouseY>=590 && mouseY<=660)){
      if(count3!=20){
        count3++;
      }
    }
    
    if((mouseX>width/2-120 && mouseX<=width/2+110) && (mouseY>=1250 && mouseY<=1400)){
      judge=3;
    }
  }
  
  if(judge==3){
    beams[num1]=true;
    if(num1<num2-1){
      beamsX[num1]=mouseX;
      num1++;
    }
  }
}
