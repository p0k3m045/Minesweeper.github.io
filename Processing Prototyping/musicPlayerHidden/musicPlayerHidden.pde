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


//Global variables
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

  minim = new Minim(this);

  songName[currentSong] = "Hell's Comin' With Me";
  currentSong++;

  songName[currentSong] = "Seven Nation Army";
  currentSong++;

  songName[currentSong] = "Bohemian Rhapsody";
  currentSong = 0;

  String soundEffect = "Click";
  String fileExtention = ".mp3";

  String musicDirectory = upArrow + open + upArrow + open + dependenciesFolder + open + musicFolder + open;

  String soundEffectsDirectory = upArrow + open + upArrow + open + dependenciesFolder + open + soundEffectsFolder + open;

  String file;

  // Load songs
  for ( int i = 0; i<numberOfSongs; i++ ) {

    file = musicDirectory + songName[i] + fileExtention;

    println("Inside FOR, Pathway:", file);

    playList[i] = minim.loadFile(file);

    if ( playList[i] != null ) {
      playListMetaData[i] = playList[i].getMetaData();
    }
  }

  // Load sound effect
  file = soundEffectsDirectory + soundEffect + fileExtention;

  soundEffects[0] = minim.loadFile(file);


  // Check that songs loaded
  for ( int i = 0; i<numberOfSongs; i++ ) {

    if ( playList[i] == null ) {
      println("The Play List or Sound Effects did not load properly");
      printArray(playList);
    }

    if ( playListMetaData[i] == null ) {
      println("The Play List or Sound Effects did not load properly");
      printArray(playList);
    }
  }
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

  if ( buttonPressed == false ) {
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

  if ( buttonPressed == false ) {
    arrow3ForButtonDivY2 = buttonDivY + buttonDivHeight * 3/6;
  } else {
    arrow3ForButtonDivY2 = buttonDivY + buttonDivHeight * 5/6;
  }


  float arrow4ForButtonDivX1 = buttonDivX + buttonDivWidth * 8/16;
  float arrow4ForButtonDivY1 = arrow3ForButtonDivY2;
  float arrow4ForButtonDivX2 = buttonDivX + buttonDivWidth * 10/16;
  float arrow4ForButtonDivY2 = buttonDivY + buttonDivHeight * 2/3;


  // Draw open/close button
  if ( mouseX >= buttonDivX && mouseY >= buttonDivY && mouseX <= buttonDivX + buttonDivWidth && mouseY <= buttonDivY + buttonDivHeight ) {

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
  if ( buttonPressed == true ) {
    musicPlayer();
  }


  // ------------------------------------------------
  // SONG FINISHED DETECTION
  // ------------------------------------------------

  if ( isPaused == false ) {

    // Detect finished song
    if ( playList[currentSong].isPlaying() == false ) {

      playList[currentSong].rewind();

      if ( autoPlay == true ) {

        currentSong++;

        if ( currentSong >= numberOfSongs ) {
          currentSong = 0;
        }

        playList[currentSong].play();
      } else {

        isPaused = true;
      }
    }
  }
}





void musicPlayer() {

  fill(255);
  stroke(0);

  rect( musicPlayerDivX, musicPlayerDivY, musicPlayerDivWidth, musicPlayerDivHeight );


  // Play/Pause button
  if ( mouseX >= playOrPauseButtonDivX && mouseY >= playOrPauseButtonDivY && mouseX <= playOrPauseButtonDivX + playOrPauseButtonDivWidth && mouseY <= playOrPauseButtonDivY + playOrPauseButtonDivHeight ) {

    fill(200);
  } else {

    fill(255);
  }

  rect( playOrPauseButtonDivX, playOrPauseButtonDivY, playOrPauseButtonDivWidth, playOrPauseButtonDivHeight );


  // Next Song button
  if ( mouseX >= nextSongDivX && mouseY >= nextSongDivY && mouseX <= nextSongDivX + nextSongDivWidth && mouseY <= nextSongDivY + nextSongDivHeight ) {

    fill(200);
  } else {

    fill(255);
  }

  rect( nextSongDivX, nextSongDivY, nextSongDivWidth, nextSongDivHeight );


  // Skip 15 button
  if ( mouseX >= skipFifteenDivX && mouseY >= skipFifteenDivY && mouseX <= skipFifteenDivX + skipFifteenDivWidth && mouseY <= skipFifteenDivY + skipFifteenDivHeight ) {

    fill(200);
  } else {

    fill(255);
  }

  rect( skipFifteenDivX, skipFifteenDivY, skipFifteenDivWidth, skipFifteenDivHeight );


  // Previous button
  if ( mouseX >= previousDivX && mouseY >= previousDivY && mouseX <= previousDivX + previousDivWidth && mouseY <= previousDivY + previousDivHeight ) {

    fill(200);
  } else {

    fill(255);
  }

  rect( previousDivX, previousDivY, previousDivWidth, previousDivHeight );


  // Back 10 button
  if ( mouseX >= backTenDivX && mouseY >= backTenDivY &&mouseX <= backTenDivX + backTenDivWidth && mouseY <= backTenDivY + backTenDivHeight ) {

    fill(200);
  } else {

    fill(255);
  }

  rect( backTenDivX, backTenDivY, backTenDivWidth, backTenDivHeight );


  fill(255);
  stroke(0);
}





void mouseClicked() {

  // Open or close music player
  if ( mouseX >= buttonDivX && mouseY >= buttonDivY && mouseX <= buttonDivX + buttonDivWidth && mouseY <= buttonDivY + buttonDivHeight ) {

    if ( buttonPressed == false ) {

      buttonPressed = true;
    } else {

      buttonPressed = false;
    }
  }


  // Play/Pause button

  if ( buttonPressed == true ) {

    if ( mouseX >= playOrPauseButtonDivX && mouseY >= playOrPauseButtonDivY && mouseX <= playOrPauseButtonDivX + playOrPauseButtonDivWidth && mouseY <= playOrPauseButtonDivY + playOrPauseButtonDivHeight ) {

      if ( isPaused == true ) {

        playList[currentSong].play();

        isPaused = false;
      } else {

        playList[currentSong].pause();

        isPaused = true;
      }
    }

    if ( mouseX >= nextSongDivX && mouseX <= nextSongDivX + nextSongDivWidth && mouseY >= nextSongDivY && mouseY <= nextSongDivY + nextSongDivHeight ) {
      if ( playList[currentSong].isPlaying(  ) ) {
        playList[currentSong].pause(  );
        playList[currentSong].rewind(  );
        //
        if ( currentSong==numberOfSongs-1 ) {
          currentSong = 0;
        } else {
          currentSong++;
        }
        playList[currentSong].play(  );
      } else {
        //
        playList[currentSong].rewind(  );
        //
        if ( currentSong==numberOfSongs-1 ) {
          currentSong = 0;
        } else {
          currentSong++;
        }
        // NEXT will not automatically play the song
        //song[currentSong].play(  );
      }
    }


    if ( mouseX >= previousDivX && mouseY >= previousDivY && mouseX <= previousDivX + previousDivWidth && mouseY <= previousDivY + previousDivHeight ) {
      if ( playList[currentSong].isPlaying(  ) ) {
        playList[currentSong].pause(  );
        playList[currentSong].rewind(  );

        if ( currentSong==0 ) {
          currentSong = numberOfSongs-1;
        } else {
          currentSong--;
        }
        playList[currentSong].play(  );
      } else {
        playList[currentSong].rewind(  );

        if ( currentSong==0 ) {
          currentSong = numberOfSongs-1;
        } else {
          currentSong--;
        }
        // does not auto-play if previously not playing
      }
    }

    if ( mouseX >= skipFifteenDivX && mouseX <= skipFifteenDivX + skipFifteenDivWidth && mouseY >= skipFifteenDivY && mouseY <= skipFifteenDivY + skipFifteenDivHeight ) {
      playList[currentSong].skip( 15000 );
    }

    //REWIND 10 BUTTON
    if ( mouseX >= backTenDivX && mouseX <= backTenDivX + backTenDivWidth && mouseY >= backTenDivY && mouseY <= backTenDivY + backTenDivHeight ) {
      playList[currentSong].skip( -10000 );
    }
  }
}





void mousePressed() {

  // Check if mouse is inside music player
  if ( buttonPressed == true && mouseX >= musicPlayerDivX && mouseX <= musicPlayerDivX + musicPlayerDivWidth && mouseY >= musicPlayerDivY && mouseY <= musicPlayerDivY + musicPlayerDivHeight * 1/8 ) {

    draggingMusicPlayer = true;

    // Remember where inside the player was clicked
    dragOffsetX = mouseX - musicPlayerDivX;
    dragOffsetY = mouseY - musicPlayerDivY;
  }
}





void mouseDragged() {

  if ( draggingMusicPlayer == true ) {

    // Move music player with mouse
    musicPlayerDivX = mouseX - dragOffsetX;
    musicPlayerDivY = mouseY - dragOffsetY;
  }
}





void mouseReleased() {

  draggingMusicPlayer = false;
}
