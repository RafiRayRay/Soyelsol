import teilchen.behavior.*;
import teilchen.*;
import teilchen.test.*;
import teilchen.util.*;
import teilchen.integration.*;
import teilchen.examples.*;
import teilchen.cubicle.*;
import teilchen.force.*;
import teilchen.wip.*;
import teilchen.constraint.*;
Physics mPhysics;
PShape kugel;
Particle myParticle;
int framecountmod;
float anzahlpartikel = 5000;
//ATTRACTOR MACHEN //////////////////////////////////////////////////////////////////
Attractor aAttractor; //mouse
Attractor a1Attractor; //mouse
Attractor bAttractor; //big reset
Attractor cAttractor;
Attractor dAttractor;
Attractor eAttractor;
Attractor fAttractor;
Attractor gAttractor;
Attractor hAttractor;
Attractor iAttractor;
Attractor jAttractor;
Attractor kAttractor;
Attractor lAttractor;
Attractor mAttractor;
Attractor b1Attractor;
Attractor c1Attractor;
Attractor d1Attractor;
Attractor e1Attractor;
Attractor f1Attractor;
Attractor g1Attractor;
Attractor h1Attractor;
Attractor i1Attractor;
Attractor j1Attractor;
Attractor k1Attractor;
Attractor l1Attractor;
Attractor m1Attractor;







void setup() {
  size(1280 , 720, P3D);
  frameRate(30);
  surface.setResizable(true);
  mPhysics = new Physics(); //particle system
  ViscousDrag myDrag = new ViscousDrag();
  myDrag.coefficient = 0.2;
  mPhysics.add(myDrag);

  attractorini();

  kugel=createShape(SPHERE, 0.5);
  kugel.setFill(color(random(254, 255), random(30, 60), 0, random(200, 255)));


  spawnParticles();
  ///// Particle erstes mal spawnen
}


//turn on mouseattractor with click
void mousePressed() {
  if (mousePressed) {
    aAttractor.strength(1000);
    a1Attractor.strength(1000);
  }
}
//releasemouse=0
void mouseReleased() {
  aAttractor.strength(0);
  a1Attractor.strength(0);
}




//////////////////////////////// DRAW //////////////// DRAW //////////////////////// DRAW ////////////////////////
void draw() {

  background(0);


 

  /*pushMatrix();          // kontrollbox
   translate(width/2, 0, 0);
   fill(255);
   box(20);
   popMatrix();
   
   */

  println(frameRate, "FPS");

  lights();
  //attractor a to mouseposition
  aAttractor.position().set(mouseX, mouseY);
  a1Attractor.position().set(mouseX+10, mouseY+10);
/*
fill(255);
ellipse(b1Attractor.position().x,b1Attractor.position().y,20,20);
ellipse(c1Attractor.position().x,c1Attractor.position().y,20,20);
ellipse(d1Attractor.position().x,d1Attractor.position().y,20,20);
*/
 // licht();

  sonne();


  Programmierung();
  blendMode(ADD);

  Partikel2();

  blendMode(BLEND);

   text(framecountmod, width/2-300, 500);

  //sterben
  for (int i = 0; i < mPhysics.particles().size(); i++) {
    Particle myParticle = mPhysics.particles(i);
    PVector v1 = new PVector(width/2, height/2, 0);
    PVector v2 = new PVector(myParticle.position().x, myParticle.position().y, myParticle.position().z);
    float d  = v1.dist(v2);
    if (d > random(900, 1200)) {
      //startpunkt von tot ändern
      // particles can be marked dead and will be removed on the next call to `Physics.step()`
      myParticle.dead(true);
      println("--------------KILL------------------");
    }
  }

  /* fill(255);
   circle(  l1Attractor.position().x, l1Attractor.position().y, 30);
   circle(m1Attractor.position().x, m1Attractor.position().y, 30);
*/
  attr(); //attractoren platzieren

  println("FC: ", frameCount);
}
///////////////////////////DRAW ENDE////////////////////////////////

void Programmierung() {
  framecountmod = frameCount%4200;

  //zusatz
  if (
    (framecountmod==255)|| (framecountmod==660)|| (framecountmod==1360)|| (framecountmod==2890)|| (framecountmod==2200)|| (framecountmod==2500)
    ) { //zusatz ort + stärke einstellen --1.1
    println("+++++++++++++ATTRACTOR CHANGE++++++++++++++++");
       anzahlpartikel = 5000;

    spawnParticles();
    l1Attractor.position().set(width/2+random(-200, 200), height/2+random(-200, 300), random(300, 350));
    m1Attractor.strength(0);
    l1Attractor.strength(random(350, 450));
    cAttractor.strength(0);
    fill(0,255,0);

  }
  if ( 
  
  (framecountmod==275)|| (framecountmod==680)|| (framecountmod==1380)|| (framecountmod==2910)|| (framecountmod==2220)|| (framecountmod==2520)
    ) { //zusatz ort + stärke einstellen --1.1


    m1Attractor.position().set(l1Attractor.position().x+random(-150, 150), l1Attractor.position().y+random(-150, 150), l1Attractor.position().z+20);
fill(0,255,0);

    m1Attractor.strength(random(350, 450));
    l1Attractor.strength(0);
    cAttractor.strength(0);
  }
  if (
  (framecountmod==315)|| (framecountmod==720)|| (framecountmod==1420)|| (framecountmod==2950)|| (framecountmod==2260)|| (framecountmod==2560)
   
    ) { //zusatz ort + stärke einstellen --1.1
    m1Attractor.strength(0);
    l1Attractor.strength(0);
    cAttractor.strength(700);
  }
  if ( 
  (framecountmod==415)|| (framecountmod==820)|| (framecountmod==1520)|| (framecountmod==3020) || (framecountmod==2360)|| (framecountmod==2660)
    
    ) { //zusatz ort + stärke einstellen --1.1
    m1Attractor.strength(0);
    l1Attractor.strength(0);
    cAttractor.strength(10000);
  }




  //1
  if (framecountmod==1) {
    spawnParticles();

    fAttractor.strength(900);
    iAttractor.strength(0);
    gAttractor.strength(0);
    hAttractor.strength(0);
  }
  if (framecountmod==10) {
    cAttractor.strength(900);
    fAttractor.strength(900);
    iAttractor.strength(0);
    gAttractor.strength(0);
    hAttractor.strength(0);
  }
  if (framecountmod==15) {
    cAttractor.strength(0);
    fAttractor.strength(400);
    iAttractor.strength(100);
    gAttractor.strength(0);
    hAttractor.strength(0);
  }
  if (framecountmod==60) {
    fAttractor.strength(0);
    iAttractor.strength(400);
    gAttractor.strength(100);
    hAttractor.strength(0);
  }
  if (framecountmod==75) {
    fAttractor.strength(0);
    iAttractor.strength(300);
    gAttractor.strength(400);
    hAttractor.strength(0);
  }
  if (framecountmod== 120) {
    fAttractor.strength(0);
    iAttractor.strength(0);
    gAttractor.strength(100);
    hAttractor.strength(400);
  }
  if (framecountmod==150) {
    fAttractor.strength(0);
    iAttractor.strength(0);
    gAttractor.strength(0);
    hAttractor.strength(0);
    cAttractor.strength(1000);
  }

  //5
  if (framecountmod==1000) {
   anzahlpartikel = 5000;
    spawnParticles();

    cAttractor.strength(0);
    e1Attractor.strength(500);
    f1Attractor.strength(0);
    g1Attractor.strength(0);
  }

  if (framecountmod==1110) {
    cAttractor.strength(0);
    e1Attractor.strength(0);
    f1Attractor.strength(500);
    g1Attractor.strength(0);
  }
  if (framecountmod==1200) {
    cAttractor.strength(0);
    e1Attractor.strength(0);
    f1Attractor.strength(0);
    g1Attractor.strength(600);
  }
  if (framecountmod==1230) {
    cAttractor.strength(0);
    e1Attractor.strength(0);
    f1Attractor.strength(0);
    g1Attractor.strength(900);
  }

  if (framecountmod==1280) {
    cAttractor.strength(900);
    e1Attractor.strength(0);
    f1Attractor.strength(0);
    g1Attractor.strength(0);
  }

  //4
  if (framecountmod==1600) {
  anzahlpartikel = 1000;
    spawnParticles();

    b1Attractor.strength(900);
    c1Attractor.strength(0);
    d1Attractor.strength(0);
  }
  if (framecountmod==1605) {
    b1Attractor.strength(100);
    c1Attractor.strength(800);
    d1Attractor.strength(0);
  }
  if (framecountmod==1610) {
    b1Attractor.strength(0);
    c1Attractor.strength(100);
    d1Attractor.strength(800);
  }
  if (framecountmod==1615) {
    b1Attractor.strength(800);
    c1Attractor.strength(0);
    d1Attractor.strength(100);
  }
  if (framecountmod==1620) {
    b1Attractor.strength(0);
    c1Attractor.strength(400);
    d1Attractor.strength(0);
  }
  if (framecountmod==1625) {
    b1Attractor.strength(0);
    c1Attractor.strength(00);
    d1Attractor.strength(500);
  }
  if (framecountmod==1630) {
    b1Attractor.strength(0);
    c1Attractor.strength(00);
    d1Attractor.strength(00);
    cAttractor.strength(5000);
  }






  //2
  if (framecountmod==1800) {
    anzahlpartikel = 5000;
    spawnParticles();

    dAttractor.strength(800);
    mAttractor.strength(0);
    kAttractor.strength(0);
    cAttractor.strength(0);
  }
  if (framecountmod==1815) {
    dAttractor.strength(0);
    mAttractor.strength(0);
    kAttractor.strength(700);

    cAttractor.strength(0);
  }
  if (framecountmod==1817) {
    dAttractor.strength(0);
    mAttractor.strength(1000);
    cAttractor.strength(0);
  }
  if (framecountmod==1830) {
    dAttractor.strength(0);
    kAttractor.strength(0);
    mAttractor.strength(0);
    cAttractor.strength(900);
  }


  //3
  if (framecountmod==2000) {
   anzahlpartikel = 6000;
    spawnParticles();

    cAttractor.strength(0);
    eAttractor.strength(900);
    jAttractor.strength(0);
    lAttractor.strength(0);
  }

  if (framecountmod==2005) {
    eAttractor.strength(100);
    jAttractor.strength(800);
    lAttractor.strength(0);
  }
  if (framecountmod==2010) {
    eAttractor.strength(0);
    jAttractor.strength(700);
    lAttractor.strength(0);
  }
  if (framecountmod==2020) {
    eAttractor.strength(0);
    jAttractor.strength(200);
    lAttractor.strength(900);
    cAttractor.strength(0);
  }
  if (framecountmod==2030) {
    eAttractor.strength(0);
    jAttractor.strength(0);
    lAttractor.strength(200);
    cAttractor.strength(700);
  }




  //6
  if (framecountmod==3300) {
       anzahlpartikel = 5000;

    spawnParticles();

    cAttractor.strength(0);
    h1Attractor.strength(600);
    i1Attractor.strength(0);
    j1Attractor.strength(0);
  }
  if (framecountmod==3320) {
    cAttractor.strength(0);
    h1Attractor.strength(0);
    i1Attractor.strength(1000);
    j1Attractor.strength(0);
  }
  if (framecountmod==3330) {
    cAttractor.strength(0);
    h1Attractor.strength(0);
    i1Attractor.strength(0);
    j1Attractor.strength(1000);
  }
  if (framecountmod==3331) {
    cAttractor.strength(0);
    h1Attractor.strength(0);
    i1Attractor.strength(0);
    j1Attractor.strength(0);
  }
  if (framecountmod==3340) {
    cAttractor.strength(-2000);
    h1Attractor.strength(0);
    i1Attractor.strength(0);
    k1Attractor.strength(0);

    j1Attractor.strength(0);
  }
  if (framecountmod==3794) {
    cAttractor.strength(0);
    h1Attractor.strength(0);
    i1Attractor.strength(0);
    k1Attractor.strength(0);

    j1Attractor.strength(0);
  }
  if (framecountmod==3900) {
    cAttractor.strength(0);
    h1Attractor.strength(0);
    i1Attractor.strength(0);
    j1Attractor.strength(0);
    k1Attractor.strength(0);
  }




  if (framecountmod==4190) { //2 min@60 fps =7200

    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, random(-1, 1), random(-1, 1), random(-1, 1) ) ;
  }



  if (framecountmod==4195) { //2 min@60 fps =7200
       anzahlpartikel = 5000;

    
  }
}


void licht() {
  pushMatrix();
  rotateY(radians(frameCount/2));
  spotLight(239, -6, 0, 800, 560, 37, 29, -5, 62, PI/89, -2);
  popMatrix();
}



void attr() {
  //////ATTRACTOR POSITIONEN ////////////////////////////////////////////////////////////////////////

  bAttractor.position().set(width/2, height/2, 0);//big reset
  cAttractor.position().set((width/2), (height/2), 0); //back in sun

  //1
  fAttractor.position().set(width/2-200, height/2-250, -300); //hinten oben links
  iAttractor.position().set(width/2-350, height/2-150, -100);//zwischen f und g
  gAttractor.position().set(width/2-200, height/2+80, +100);//links links
  hAttractor.position().set(width/2-50, height/2+100, +200);//links vorn
  //3
  eAttractor.position().set(width/2+150, height/2+ 200, 200);//
  jAttractor.position().set(width/2+350, height/2+ 150, 0);
  lAttractor.position().set(width/2+100, height/2, -250);

  //2
  dAttractor.position().set(width/2-30, height/2-200, 50);//
  kAttractor.position().set(width/2-40, height/2-250, 50); //mitte mitte vorne
  mAttractor.position().set(width/2-100, height/2-50, 50);
  //4
  b1Attractor.position().set(width/2+100, height/2-210, -100);
  c1Attractor.position().set(width/2+200, height/2-270, 0);
  d1Attractor.position().set(width/2+100, height/2-190, 100);

  //5
  e1Attractor.position().set(width/2+150, height/2+100, 250);
  f1Attractor.position().set(width/2+250, height/2+200, -200);
  g1Attractor.position().set(width/2+150, height/2+150, -200);
  //6
  h1Attractor.position().set(width/2+250, height/2, 50);
  i1Attractor.position().set(width/2+200, height/2, 200);
  j1Attractor.position().set(width/2, height/2, 300);
  k1Attractor.position().set(width/2-250, height/2, 0);

  //zusatz
  /*
  l1Attractor.position().set(0, 0, 0);
   m1Attractor.position().set(0, 0, 0);
   */
  final float mDeltaTime =1.0f/frameRate;
  mPhysics.step(mDeltaTime);
}


void keyPressed() {
  switch (key) {
  case '1':

    break;
  case '2':

    break;
  case ' ':
    spawnParticles();
    break;
  case '3':
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, random(-1, 1), random(-1, 1), random(-1, 1) ) ;
    break;
  case '4':

    break;
  case '5':

    break;
  case '6':

    break;
  case 'B':
  case 'b':
    bAttractor.strength(1000);
    break;
  }
}


void spawnParticles() {
  //create particles
  mPhysics.particles().clear();
  cAttractor.strength(0);
  println("******************SPAWN*********************");

  for (int i = 0; i<anzahlpartikel; i++) {
    Particle mParticle =mPhysics.makeParticle();
    mParticle.position().set(random((width/2)-60, (width/2)+60), random((height/2)-60, (height/2)+60), random(-60, 60));        //start position ändern
    //mParticle.position().set(100,100,0);
    mParticle.mass(random(1.0f, 5.0f));
  }
}


void sonne() {
  pushMatrix();
  translate(width/2, height/2, 0);
  noStroke();
  fill(255, 136, 0);
  sphere(300);
  popMatrix();
}



void Partikel2() {
  for (int i = 0; i<mPhysics.particles().size(); i++) {
    Particle myParticle =mPhysics.particles(i);
    pushMatrix();
    translate(myParticle.position().x,
      myParticle.position().y,
      myParticle.position().z);
    shape(kugel);
    popMatrix();
  }
}

void attractorini() {
  /////// ATTRACTOR INITIALISIEREN   - - - ANFANG - - -/////////////////////////////////////////
  //MOUSE
  aAttractor = new Attractor();
  aAttractor.radius(300);
  aAttractor.strength(0);
  mPhysics.add(aAttractor);
  a1Attractor = new Attractor();
  a1Attractor.radius(300);
  a1Attractor.strength(0);
  mPhysics.add(a1Attractor);



  bAttractor = new Attractor(); // big reset
  bAttractor.radius(100000);
  bAttractor.strength(50);
  mPhysics.add(bAttractor);

  cAttractor = new Attractor(); //little reset side
  cAttractor.radius(1000);
  cAttractor.strength(0);
  mPhysics.add(cAttractor);

  dAttractor = new Attractor();
  dAttractor.radius(1000);
  dAttractor.strength(0);
  mPhysics.add(dAttractor);

  eAttractor = new Attractor();
  eAttractor.radius(1000);
  eAttractor.strength(0);
  mPhysics.add(eAttractor);

  fAttractor = new Attractor();
  fAttractor.radius(900);
  fAttractor.strength(0);
  mPhysics.add(fAttractor);

  gAttractor = new Attractor();
  gAttractor.radius(700);
  gAttractor.strength(0);
  mPhysics.add(gAttractor);

  hAttractor = new Attractor();
  hAttractor.radius(600);
  hAttractor.strength(0);
  mPhysics.add(hAttractor);

  iAttractor = new Attractor();
  iAttractor.radius(700);
  iAttractor.strength(0);
  mPhysics.add(iAttractor);

  jAttractor = new Attractor();
  jAttractor.radius(900);
  jAttractor.strength(0);
  mPhysics.add(jAttractor);

  kAttractor = new Attractor();
  kAttractor.radius(1000);
  kAttractor.strength(0);
  mPhysics.add(kAttractor);

  lAttractor = new Attractor();
  lAttractor.radius(900);
  lAttractor.strength(0);
  mPhysics.add(lAttractor);

  mAttractor = new Attractor();
  mAttractor.radius(1000);
  mAttractor.strength(0);
  mPhysics.add(mAttractor);


  b1Attractor = new Attractor(); // big reset
  b1Attractor.radius(900);
  b1Attractor.strength(0);
  mPhysics.add(b1Attractor);

  c1Attractor = new Attractor(); //back side
  c1Attractor.radius(500);
  c1Attractor.strength(0);
  mPhysics.add(c1Attractor);

  d1Attractor = new Attractor();
  d1Attractor.radius(500);
  d1Attractor.strength(0);
  mPhysics.add(d1Attractor);

  e1Attractor = new Attractor();
  e1Attractor.radius(1000);
  e1Attractor.strength(0);
  mPhysics.add(e1Attractor);

  f1Attractor = new Attractor();
  f1Attractor.radius(900);
  f1Attractor.strength(0);
  mPhysics.add(f1Attractor);

  g1Attractor = new Attractor();
  g1Attractor.radius(900);
  g1Attractor.strength(0);
  mPhysics.add(g1Attractor);

  h1Attractor = new Attractor();
  h1Attractor.radius(800);
  h1Attractor.strength(0);
  mPhysics.add(h1Attractor);

  i1Attractor = new Attractor();
  i1Attractor.radius(700);
  i1Attractor.strength(0);
  mPhysics.add(i1Attractor);

  j1Attractor = new Attractor();
  j1Attractor.radius(900);
  j1Attractor.strength(0);
  mPhysics.add(j1Attractor);

  k1Attractor = new Attractor();
  k1Attractor.radius(300);
  k1Attractor.strength(0);
  mPhysics.add(k1Attractor);

  l1Attractor = new Attractor();
  l1Attractor.radius(900);
  l1Attractor.strength(0);
  mPhysics.add(l1Attractor);

  m1Attractor = new Attractor();
  m1Attractor.radius(900);
  m1Attractor.strength(0);
  mPhysics.add(m1Attractor);
  /////// ATTRACTOR INITIALISIEREN   - - - ENDE - - - /////////////////////////////////////////
}
