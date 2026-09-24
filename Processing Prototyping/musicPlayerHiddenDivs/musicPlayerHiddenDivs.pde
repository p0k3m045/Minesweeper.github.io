//Global Variables
int appWidth;
int appHeight;

float buttonDivX, buttonDivY, buttonDivWidth, buttonDivHeight;
float musicPlayerDivX, musicPlayerDivY, musicPlayerDivWidth, musicPlayerDivHeight;
float playOrPauseButtonDivX, playOrPauseButtonDivY, playOrPauseButtonDivWidth, playOrPauseButtonDivHeight;
float skipFifteenDivX, skipFifteenDivY, skipFifteenDivWidth, skipFifteenDivHeight;
float backTenDivX, backTenDivY, backTenDivWidth, backTenDivHeight;
float nextSongDivX, nextSongDivY, nextSongDivWidth, nextSongDivHeight;
float previousDivX, previousDivY, previousDivWidth, previousDivHeight;

float arrow1ForButtonDivY2, arrow3ForButtonDivY2;

boolean buttonPressed = false;
boolean draggingMusicPlayer = false;

float dragOffsetX;
float dragOffsetY;


void setup() {
  fullScreen();

  appWidth = displayWidth;
  appHeight = displayHeight;

  println(displayWidth, displayHeight);

  //Divs();

  // Starting position of music player
  musicPlayerDivX = appWidth / 4;
  musicPlayerDivY = appHeight / 4;
}


void draw() {

  background(100);


  // Button
  buttonDivX = appWidth / 100;
  buttonDivY = appHeight * 92.5 / 100;
  buttonDivWidth = appWidth / 5;
  buttonDivHeight = appHeight / 20;


  // Play/Pause button
  playOrPauseButtonDivX = musicPlayerDivX + musicPlayerDivWidth * 13/32;
  playOrPauseButtonDivY = musicPlayerDivY + musicPlayerDivHeight * 6/8;
  playOrPauseButtonDivWidth = musicPlayerDivWidth * 6/32;
  playOrPauseButtonDivHeight = musicPlayerDivHeight * 6/32;


  // Next button
  nextSongDivX = musicPlayerDivX + musicPlayerDivWidth * 26/32;
  nextSongDivY = musicPlayerDivY + musicPlayerDivHeight * 25/32;
  nextSongDivWidth = musicPlayerDivWidth * 4/32;
  nextSongDivHeight = musicPlayerDivHeight * 4/32;


  // Previous button
  previousDivX = musicPlayerDivX + musicPlayerDivWidth * 2/32;
  previousDivY = musicPlayerDivY + musicPlayerDivHeight * 25/32;
  previousDivWidth = musicPlayerDivWidth * 4/32;
  previousDivHeight = musicPlayerDivHeight * 4/32;


  // FF 15 button
  skipFifteenDivX = musicPlayerDivX + musicPlayerDivWidth * 20.5/32;
  skipFifteenDivY = musicPlayerDivY + musicPlayerDivHeight * 25/32;
  skipFifteenDivWidth = musicPlayerDivWidth * 4/32;
  skipFifteenDivHeight = musicPlayerDivHeight * 4/32;


  // RR 10 button
  backTenDivX = musicPlayerDivX + musicPlayerDivWidth * 7.5/32;
  backTenDivY = musicPlayerDivY + musicPlayerDivHeight * 25/32;
  backTenDivWidth = musicPlayerDivWidth * 4/32;
  backTenDivHeight = musicPlayerDivHeight * 4/32;


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


  // Draw open/close button
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


  // Music player size
  musicPlayerDivWidth = appHeight / 2;
  musicPlayerDivHeight = appHeight / 2;


  // Draw music player
  if (buttonPressed == true) {
    musicPlayer();
  }
}


void musicPlayer() {

  fill(255);
  stroke(0);

  rect(musicPlayerDivX, musicPlayerDivY,
    musicPlayerDivWidth, musicPlayerDivHeight);


  // Play/Pause button
  if (mouseX >= playOrPauseButtonDivX &&
    mouseY >= playOrPauseButtonDivY &&
    mouseX <= playOrPauseButtonDivX + playOrPauseButtonDivWidth &&
    mouseY <= playOrPauseButtonDivY + playOrPauseButtonDivHeight) {

    fill(200);
  } else {

    fill(255);
  }

  rect(playOrPauseButtonDivX, playOrPauseButtonDivY,
    playOrPauseButtonDivWidth, playOrPauseButtonDivHeight);


  // Next Song button
  if (mouseX >= nextSongDivX &&
    mouseY >= nextSongDivY &&
    mouseX <= nextSongDivX + nextSongDivWidth &&
    mouseY <= nextSongDivY + nextSongDivHeight) {

    fill(200);
  } else {

    fill(255);
  }

  rect(nextSongDivX, nextSongDivY,
    nextSongDivWidth, nextSongDivHeight);


  // Skip 15 button
  if (mouseX >= skipFifteenDivX &&
    mouseY >= skipFifteenDivY &&
    mouseX <= skipFifteenDivX + skipFifteenDivWidth &&
    mouseY <= skipFifteenDivY + skipFifteenDivHeight) {

    fill(200);
  } else {

    fill(255);
  }

  rect(skipFifteenDivX, skipFifteenDivY,
    skipFifteenDivWidth, skipFifteenDivHeight);


  // Previous button
  if (mouseX >= previousDivX &&
    mouseY >= previousDivY &&
    mouseX <= previousDivX + previousDivWidth &&
    mouseY <= previousDivY + previousDivHeight) {

    fill(200);
  } else {

    fill(255);
  }

  rect(previousDivX, previousDivY,
    previousDivWidth, previousDivHeight);


  // Back 10 button
  if (mouseX >= backTenDivX &&
    mouseY >= backTenDivY &&
    mouseX <= backTenDivX + backTenDivWidth &&
    mouseY <= backTenDivY + backTenDivHeight) {

    fill(200);
  } else {

    fill(255);
  }

  rect(backTenDivX, backTenDivY,
    backTenDivWidth, backTenDivHeight);


  fill(255);
  stroke(0);
}


void mouseClicked() {

  // Open or close music player
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


void mousePressed() {

  // Check if mouse is inside music player
  if (buttonPressed == true &&
    mouseX >= musicPlayerDivX &&
    mouseX <= musicPlayerDivX + musicPlayerDivWidth &&
    mouseY >= musicPlayerDivY &&
    mouseY <= musicPlayerDivY + musicPlayerDivHeight * 1/8) {

    draggingMusicPlayer = true;

    // Remember where inside the player was clicked
    dragOffsetX = mouseX - musicPlayerDivX;
    dragOffsetY = mouseY - musicPlayerDivY;
  }
}


void mouseDragged() {

  if (draggingMusicPlayer == true) {

    // Move music player with mouse
    musicPlayerDivX = mouseX - dragOffsetX;
    musicPlayerDivY = mouseY - dragOffsetY;
  }
}


void mouseReleased() {

  draggingMusicPlayer = false;
}
