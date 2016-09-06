

//**************************** global variables ****************************
pts P = new pts(); // class containing array of points, used to standardize GUI
float t=-2.0, f=0;
float leafT1 = -1.0;
float leafT2 = -1.0;
float leafT3 = -1.0;
float maxf = 200;
int colorIndex = 0;
boolean forward = true;
float theta;  

//**************************** initialization ****************************
void setup()               // executed once at the begining 
  {
  size(800, 800);            // window size
  frameRate(90);             // render 90 frames per second
  smooth();                  // turn on antialiasing
  P.declare(); // declares all points in P. MUST BE DONE BEFORE ADDING POINTS
  P.loadPts("data/pts");  // loads points form file saved with this program
  background(white);
  pic1 = loadImage("pic1.JPG");
  } 

//**************************** display current frame ****************************
void draw()
  {
    background(0);
   
    //Leaves in tree
    pt A=P.G[0], B=P.G[1], C=P.G[2], D=P.G[3];
    pt E=P.G[4], F=P.G[5], G=P.G[6], H=P.G[7];
    pt I=P.G[8], J=P.G[9], K=P.G[10], L=P.G[11];
    
    //Falling leaves
    pt M=P.G[12], N=P.G[13], O=P.G[14], S=P.G[15];
    pt T=P.G[16], U=P.G[17], V=P.G[18];
   
    pen(#49AC15, 2); fill(#49AC15);
    
    //FLOATING LEAVES IN TREE
    
    pt Pt = getSpiralPt(E,F,K,L,t);
    ellipse(Pt.x,Pt.y,10,20);
    
    pt Pt2 = getSpiralPt(I,J,G,H,t);
    ellipse(Pt2.x,Pt2.y,10,20);
    
    pt Pt3 = getSpiralPt(A,B,G,H,t);
    ellipse(Pt3.x,Pt3.y,10,20);
    
    pt Pt4 = getSpiralPt(E,F,C,D,t);
    ellipse(Pt4.x,Pt4.y,10,20);
    
    
    //FALLING LEAVES
    
    pt leaf1 = showSpiralThrough3Points(A,M,N,leafT1);
    if(mouseX > leaf1.x-20 && mouseX < leaf1.x+20 &&     //if mouse on leaf1
      mouseY > leaf1.y-30 && mouseY < leaf1.y+30){
        ellipse(leaf1.x,leaf1.y,20,30);
    } else {
      leafT1 += 0.01;
      leaf1 = showSpiralThrough3Points(A,M,N,leafT1);
      ellipse(leaf1.x,leaf1.y,20,30);
      if (leafT1 > 1.05){
        leafT1 = -1;
      }
    }
    
    pt leaf2 = showSpiralThrough3Points(A,O,S,leafT2);
    if(mouseX > leaf2.x-20 && mouseX < leaf2.x+20 &&     //if mouse on leaf2
      mouseY > leaf2.y-30 && mouseY < leaf2.y+30){
        ellipse(leaf2.x,leaf2.y,20,30);
    } else {
      leafT2 += 0.01;
      leaf2 = showSpiralThrough3Points(A,O,S,leafT2);
      ellipse(leaf2.x,leaf2.y,20,30);
      if (leafT2 > 1.05){
        leafT2 = -1;
      }
    }
    
    pt leaf3 = showSpiralThrough3Points(T,U,V,leafT3);
    if(mouseX > leaf3.x-20 && mouseX < leaf3.x+20 &&     //if mouse on leaf3
      mouseY > leaf3.y-30 && mouseY < leaf3.y+30){
        ellipse(leaf3.x,leaf3.y,20,30);
    } else {
      leafT3 += 0.01;
      leaf3 = showSpiralThrough3Points(T,U,V,leafT3);
      ellipse(leaf3.x,leaf3.y,20,30);
      if (leafT3 > 1.05){
        leafT3 = -1;
      }
    }
    
  
    displayHeader();
  
    //DRAW TREE
    stroke(255);
    // Let's pick an angle 0 to 90 degrees based on the mouse position
    float a = (550 / (float) width) * 90f;
    // Convert it to radians
    theta = radians(a);
    // Start the tree from the bottom of the screen
    translate(width/2,height);
    // Draw a line 120 pixels
    line(0,0,0,-360);
    // Move to the end of that line
    translate(0,-360);
    // Start the recursive branching!
    branch(230);

    if(forward)
      t += .01;
    else
      t -= .01;
    if(t > 1.2)
      forward = false;
    if(t < -2)
      forward = true;
  }
  
  
void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // draw two new branches
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}