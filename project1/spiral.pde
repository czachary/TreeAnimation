//************************************************************************
//**** SPIRAL
//************************************************************************

// POINT ON SPIRAL FROM A WITH FIXED POINT G

// COMPUTE PARAMETERS OF SPIRAL MOTION THAT MORPHS EDGE(A,B) TO EDGE(C,D)
float spiralAngle(pt A, pt B, pt C, pt D) {return angle(V(A,B),V(C,D));}

float spiralScale(pt A, pt B, pt C, pt D) {return d(C,D)/d(A,B);}

// IMAGE OF POINT Q BY SPIRAL MOTION THAT MORPHS EDGE(A,B) AND EDGE(C,D)
pt SpiralCenter(float a, float m, pt A, pt C)  // computes center of spiral that takes A to C and B to D
  {
  float c=cos(a), s=sin(a);
  vec U = V(m*c-1,m*s);
  float u2 = dot(U,U);
  vec CA = V(C,A);
  vec V = V(dot(U,CA)/u2,det(U,CA)/u2);
  return P(A,V);
  }

pt spiralPt(pt A, pt F, float m, float a, float t)     //  A rotated by at and scaled by s^t wrt G
  {return L(F,R(A,t*a,F),pow(m,t));}  
  
pt getSpiralPt(pt A, pt B, pt C, pt D, float t)
{
  float a =spiralAngle(A,B,C,D); 
  float m =spiralScale(A,B,C,D);
  pt F = SpiralCenter(a, m, A, C);
  return L(F,R(A,t*a,F),pow(m,t));
}

pt showSpiralThrough3Points(pt A, pt B, pt C, float t) 
  {
  float a =spiralAngle(A,B,B,C); 
  float m =spiralScale(A,B,B,C);
  pt F = SpiralCenter(a, m, A, B); 
  return spiralPt(B,F,m,a,t);
  }



  