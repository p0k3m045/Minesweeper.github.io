/*
//Minim library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
int numberOfSongs = 3;
int numberOfSoundEffects = 1;
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
AudioMetaData[] playListMetaData = new AudioMetaData[ numberOfSongs ];
AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong = numberOfSongs - numberOfSongs;
String[] songName = new String[numberOfSongs];
*/

//Global variables
int appWidth;
int appHeight;

float buttonDivX, buttonDivY, buttonDivWidth, buttonDivHeight;
float musicPlayerDivX, musicPlayerDivY, musicPlayerDivWidth, musicPlayerDivHeight;
float playOrPauseButtonDivX, playOrPauseButtonDivY, playOrPauseButtonDivWidth, playOrPauseButtonDivHeight;

float arrow1ForButtonDivY2, arrow3ForButtonDivY2;

boolean buttonPressed = false;
boolean draggingMusicPlayer = false;

boolean isPaused = true;
boolean isMuted = false;
boolean autoPlay = false;

float dragOffsetX;
float dragOffsetY;

String upArrow = "..";
String open = "/";
String dependenciesFolder = "Dependencies";
String musicFolder = "Music";
String soundEffectsFolder = "Sound Effects";
String imagesFolder = "Images";






void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;

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

  playOrPauseButtonDivX = musicPlayerDivX + musicPlayerDivWidth * 13/32;
  playOrPauseButtonDivY = musicPlayerDivY + musicPlayerDivHeight * 6/8;
  playOrPauseButtonDivWidth = musicPlayerDivWidth * 3/16;
  playOrPauseButtonDivHeight = musicPlayerDivHeight * 3/16;

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

  if (mouseX >= buttonDivX && mouseY >= buttonDivY && mouseX <= buttonDivX + buttonDivWidth && mouseY <= buttonDivY + buttonDivHeight) {
    fill(0);
    stroke(255);
  } else {
    fill(255);
    stroke(0);
  }
  rect(buttonDivX, buttonDivY, buttonDivWidth, buttonDivHeight);

  line(arrow1ForButtonDivX1, arrow1ForButtonDivY1, arrow1ForButtonDivX2, arrow1ForButtonDivY2);
  line(arrow2ForButtonDivX1, arrow2ForButtonDivY1, arrow2ForButtonDivX2, arrow2ForButtonDivY2);
  line(arrow3ForButtonDivX1, arrow3ForButtonDivY1, arrow3ForButtonDivX2, arrow3ForButtonDivY2);
  line(arrow4ForButtonDivX1, arrow4ForButtonDivY1, arrow4ForButtonDivX2, arrow4ForButtonDivY2);

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
  rect(musicPlayerDivX, musicPlayerDivY, musicPlayerDivWidth, musicPlayerDivHeight);

  if (mouseX >= playOrPauseButtonDivX && mouseY >= playOrPauseButtonDivY && mouseX <= playOrPauseButtonDivX + playOrPauseButtonDivWidth && mouseY <= playOrPauseButtonDivY + playOrPauseButtonDivHeight) {
    fill(200);
  } else {
    fill(255);
  }
  rect(playOrPauseButtonDivX, playOrPauseButtonDivY, playOrPauseButtonDivWidth, playOrPauseButtonDivHeight);

  fill(255);
  stroke(0);
}







void mouseClicked() {

  // Open or close music player
  if (mouseX >= buttonDivX && mouseY >= buttonDivY && mouseX <= buttonDivX + buttonDivWidth && mouseY <= buttonDivY + buttonDivHeight) {

    if (buttonPressed == false) {
      buttonPressed = true;
    } else {
      buttonPressed = false;
    }
  }
}







void mousePressed() {

  // Check if mouse is inside music player
  if (buttonPressed == true && mouseX >= musicPlayerDivX && mouseX <= musicPlayerDivX + musicPlayerDivWidth && mouseY >= musicPlayerDivY && mouseY <= musicPlayerDivY + musicPlayerDivHeight * 1/8) {

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
