void setup() {
  fullScreen();

  float appWidth = displayWidth;
  float appHeight = displayHeight;

  float autoplayDivX = appWidth * 1/4;
  float autoplayDivY = appHeight * 1/4;
  float autoplayDivWidth = appHeight * 1/2;
  float autoplayDivHeight = autoplayDivWidth;


  float toggleCircleInset = autoplayDivWidth*5/32;

  //Outer Capsule
  float toggleCapsuleDivX = autoplayDivX + autoplayDivWidth*1/8;
  float toggleCapsuleDivY = autoplayDivY + autoplayDivHeight*5/16;
  float toggleCapsuleDivWidth = autoplayDivWidth*3/4;
  float toggleCapsuleDivHeight = autoplayDivHeight*3/8;
  float toggleCapsuleCornerDiv = autoplayDivHeight*3/16;

  //Left Circle
  float toggleCircleLeftDivX = toggleCapsuleDivX + toggleCircleInset;
  float toggleCircleLeftDivY = autoplayDivY + autoplayDivHeight*1/2;
  float toggleCircleLeftDivDiameter = autoplayDivHeight*4/8;

  //Right Circle
  float toggleCircleRightDivX = toggleCapsuleDivX + toggleCapsuleDivWidth - toggleCircleInset;
  float toggleCircleRightDivY = autoplayDivY + autoplayDivHeight*1/2;
  float toggleCircleRightDivDiameter = autoplayDivHeight*4/8;

  //
  // PAUSE SYMBOL
  //
  float togglePauseLeftDivX = toggleCircleLeftDivX - autoplayDivWidth*1/16;
  float togglePauseLeftDivY = autoplayDivY + autoplayDivHeight*13/32;
  float togglePauseLeftDivWidth = autoplayDivWidth*1/24;
  float togglePauseLeftDivHeight = autoplayDivHeight*3/16;

  float togglePauseRightDivX = toggleCircleLeftDivX + autoplayDivWidth*1/32;
  float togglePauseRightDivY = autoplayDivY + autoplayDivHeight*13/32;
  float togglePauseRightDivWidth = autoplayDivWidth*1/24;
  float togglePauseRightDivHeight = autoplayDivHeight*3/16;

  //
  // PLAY SYMBOL
  //
  float togglePlayTriangleDivX1 = toggleCircleRightDivX - autoplayDivWidth*1/24;
  float togglePlayTriangleDivY1 = autoplayDivY + autoplayDivHeight*13/32;

  float togglePlayTriangleDivX2 = toggleCircleRightDivX - autoplayDivWidth*1/24;
  float togglePlayTriangleDivY2 = autoplayDivY + autoplayDivHeight*19/32;

  float togglePlayTriangleDivX3 = toggleCircleRightDivX + autoplayDivWidth*1/12;
  float togglePlayTriangleDivY3 = autoplayDivY + autoplayDivHeight*1/2;


  rect( autoplayDivX, autoplayDivY, autoplayDivWidth, autoplayDivHeight );
  rect( toggleCapsuleDivX, toggleCapsuleDivY, toggleCapsuleDivWidth, toggleCapsuleDivHeight, toggleCapsuleCornerDiv );
  circle( toggleCircleLeftDivX, toggleCircleLeftDivY, toggleCircleLeftDivDiameter );
  rect( togglePauseLeftDivX, togglePauseLeftDivY, togglePauseLeftDivWidth, togglePauseLeftDivHeight, autoplayDivWidth*1/64 );
  rect( togglePauseRightDivX, togglePauseRightDivY, togglePauseRightDivWidth, togglePauseRightDivHeight, autoplayDivWidth*1/64 );
}

void draw() {}
