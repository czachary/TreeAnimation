// LecturesInGraphics: utilities
// Author: Jarek ROSSIGNAC, last edited on August, 2016 

PImage pic1;
PImage pic2;

// ************************************************************************ COLORS 
color black=#000000, white=#FFFFFF, // set more colors using Menu >  Tools > Color Selector
   red=#FF0000, green=#00FF01, blue=#0300FF, yellow=#FEFF00, cyan=#00FDFF, magenta=#FF00FB, grey=#5F5F5F;

// ************************************************************************ GRAPHICS 
void pen(color c, float w) {stroke(c); strokeWeight(w);}
void showDisk(float x, float y, float r) {ellipse(x,y,r*2,r*2);}

//***************************************************************************************** MAKING A MOVIE

boolean change=false;   // true when the user has presed a key or moved the mouse
boolean animating=false; // must be set by application during animations to force frame capture
int frameCounter=0;

void scribeHeader(String S, int i) { pen(white,2);fill(white); text(S,10,20+i*20); noFill();} // writes white at line i
void scribeHeaderRight(String S) {fill(white); text(S,width-7.5*S.length(),20); noFill();} // writes black on screen top, right-aligned
void displayHeader()  // Displays title and authors face on screen
    {
    scribeHeader(title,0);       scribeHeaderRight(name); 
    scribeHeader(subtitle,1);
    image(pic1, width-pic1.width/5,25,pic1.width/5,pic1.height/5);
    }
    
String title ="Project 1",            name ="Christina Zachary",
       subtitle = "   for Jarek Rossignac's CS3451 class in the Fall 2016";