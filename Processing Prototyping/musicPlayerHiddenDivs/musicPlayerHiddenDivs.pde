// Global Variables
int appWidth;
int appHeight;

boolean buttonPressed = false;
boolean draggingMusicPlayer = false;



float dragOffsetX;
float dragOffsetY;

float buttonDivX, buttonDivY, buttonDivWidth, buttonDivHeight;

float arrow1ForButtonDivY2;
float arrow3ForButtonDivY2;


void setup() {
  fullScreen();

  appWidth = displayWidth;
  appHeight = displayHeight;
}


void draw() {
  background(100);



  // Button
  buttonDivX = appWidth / 100;
  buttonDivY = appHeight * 92.5 / 100;
  buttonDivWidth = appWidth / 5;
  buttonDivHeight = appHeight / 20;


  // Button arrows
  float arrow1ForButtonDivX1 = buttonDivX + buttonDivWidth * 6/16;
  float arrow1ForButtonDivY1 = buttonDivY + buttonDivHeight * 1/3;

  float arrow1ForButtonDivX2 = buttonDivX + buttonDivWidth * 8/16;


  if (buttonPressed == false) {
    arrow1ForButtonDivY2 = buttonDivY + buttonDivHeight * 1/6;
  } else {
    arrow1ForButtonDivY2 = buttonDivY + buttonDivHeight * 3/6;
  }


  float arrow2ForButtonDivX1 = buttonDivX + buttonDivWidth * 8/16;
  float arrow2ForButtonDivY1 = arrow1ForButtonDivY2;
  float arrow2ForButtonDivX2 = buttonDivX + buttonDivWidth * 10/16;
  float arrow2ForButtonDivY2 = buttonDivY + buttonDivHeight * 1/3;


  float arrow3ForButtonDivX1 = buttonDivX + buttonDivWidth * 6/16;
  float arrow3ForButtonDivY1 = buttonDivY + buttonDivHeight * 2/3;

  float arrow3ForButtonDivX2 = buttonDivX + buttonDivWidth * 8/16;


  if (buttonPressed == false) {
    arrow3ForButtonDivY2 = buttonDivY + buttonDivHeight * 3/6;
  } else {
    arrow3ForButtonDivY2 = buttonDivY + buttonDivHeight * 5/6;
  }


  float arrow4ForButtonDivX1 = buttonDivX + buttonDivWidth * 8/16;
  float arrow4ForButtonDivY1 = arrow3ForButtonDivY2;
  float arrow4ForButtonDivX2 = buttonDivX + buttonDivWidth * 10/16;
  float arrow4ForButtonDivY2 = buttonDivY + buttonDivHeight * 2/3;


  // Draw button
  if (mouseX >= buttonDivX &&
    mouseY >= buttonDivY &&
    mouseX <= buttonDivX + buttonDivWidth &&
    mouseY <= buttonDivY + buttonDivHeight) {

    fill(0);
    stroke(255);
  } else {

    fill(255);
    stroke(0);
  }


  rect(buttonDivX, buttonDivY, buttonDivWidth, buttonDivHeight);


  line(arrow1ForButtonDivX1, arrow1ForButtonDivY1,
    arrow1ForButtonDivX2, arrow1ForButtonDivY2);

  line(arrow2ForButtonDivX1, arrow2ForButtonDivY1,
    arrow2ForButtonDivX2, arrow2ForButtonDivY2);

  line(arrow3ForButtonDivX1, arrow3ForButtonDivY1,
    arrow3ForButtonDivX2, arrow3ForButtonDivY2);

  line(arrow4ForButtonDivX1, arrow4ForButtonDivY1,
    arrow4ForButtonDivX2, arrow4ForButtonDivY2);

  fill(#FFFFFF);
  stroke(#000000);

  if (buttonPressed == true) {
    Divs();
  }
}


// Open/close button
void mouseClicked() {

  if (mouseX >= buttonDivX &&
    mouseY >= buttonDivY &&
    mouseX <= buttonDivX + buttonDivWidth &&
    mouseY <= buttonDivY + buttonDivHeight) {

    if (buttonPressed == false) {
      buttonPressed = true;
    } else {
      buttonPressed = false;
    }
  }
}


// Start dragging
void mousePressed() {

  if (buttonPressed == true && mouseX >= divs[0] && mouseX <= divs[0] + divs[2] && mouseY >= divs[1] && mouseY <= divs[1] + divs[3] * 1/8) {
    if (mouseX >= divs[4] && mouseX <= divs[4] + divs[6] && mouseY >= divs[5] && mouseY <= divs[5] + divs[7]) {
    } else if (mouseX >= divs[8] && mouseX <= divs[8] + divs[10] && mouseY >= divs[9] && mouseY <= divs[9] + divs[11]) {
    } else {
      
      draggingMusicPlayer = true;

      dragOffsetX = mouseX - divs[0];
      dragOffsetY = mouseY - divs[1];
    }
  }
}


// Drag music player
void mouseDragged() {

  if (draggingMusicPlayer == true) {

    divs[0] = mouseX - dragOffsetX;
    divs[1] = mouseY - dragOffsetY;
  }
}


// Stop dragging
void mouseReleased() {

  draggingMusicPlayer = false;
}
