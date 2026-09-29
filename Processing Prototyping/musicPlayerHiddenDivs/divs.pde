// Global variables
int numberOfDivs = 7;
int numberOfParameters = 4;
float[] divs = new float[numberOfDivs * numberOfParameters];

void Divs() {
  /*
  // Button
   divs[0] = appWidth / 100;
   divs[1] = appHeight * 92.5 / 100;
   divs[2] = appWidth / 5;
   divs[3] = appHeight / 20;
   */

  /*
  // Music player
   divs[0] = mouseX - dragOffsetX;
   divs[1] = mouseY - dragOffsetY;
   divs[2] = appHeight / 2;
   divs[3] = appHeight / 2;
   */



  for ( int i=0; i<4; i++) {
    if ( i%4==0 ) {
      divs[i] = mouseX - dragOffsetX;
    }
    if ( i%4==1 ) {
      divs[i] = mouseY - dragOffsetY;
    }
    if ( i%4==2 ) {
      divs[i] = appHeight*1/2;
    }
    if ( i%4==3 ) {
      divs[i] = appHeight*1/2;
    }
  }
  printArray(divs);


  float referent = divs[2] / 64;

  float column1 = divs[0] + referent * 8;
  float column2 = divs[0] + referent * 15;
  float column3 = divs[0] + referent * 16;
  float column4 = divs[0] + referent * 26;
  float column5 = divs[0] + referent * 41;
  float column6 = divs[0] + referent * 52;


  float row1 = divs[1] + referent * 2;
  float row2 = divs[1] + referent * 34;
}

/*
   // Previous song
 divs[8] = divs[4] + divs[6] * 2/32;
 divs[9] = divs[5] + divs[7] * 25/32;
 divs[10] = divs[6] * 4/32;
 divs[11] = divs[7] * 4/32;
 
 // RR 10
 divs[12] = divs[4] + divs[6] * 7.5/32;
 divs[13] = divs[5] + divs[7] * 25/32;
 divs[14] = divs[6] * 4/32;
 divs[15] = divs[7] * 4/32;
 
 // Play/Pause button
 divs[16] = divs[4] + divs[6] * 13/32;
 divs[17] = divs[5] + divs[7] * 6/8;
 divs[18] = divs[6] * 6/32;
 divs[19] = divs[7] * 6/32;
 
 // FF 15
 divs[20] = divs[4] + divs[6] * 20.5/32;
 divs[21] = divs[5] + divs[7] * 25/32;
 divs[22] = divs[6] * 4/32;
 divs[23] = divs[7] * 4/32;
 
 // Next button
 divs[20] = divs[4] + divs[6] * 26/32;
 divs[21] = divs[5] + divs[7] * 25/32;
 divs[22] = divs[6] * 4/32;
 divs[23] = divs[7] * 4/32;
 */
/* Progress bar
 divs[24] = divs[4] + divs[6] * 26/32;
 divs[25] =  +  * ;
 divs[26] =  * ;
 divs[27] =  * ;
 
 // Song name
 divs[28] =  +  * ;
 divs[29] =  +  * ;
 divs[30] =  * ;
 divs[31] =  * ;
 
 // Album image
 divs[32] =  +  * ;
 divs[33] =  +  * ;
 divs[34] =  * ;
 divs[35] =  * ;
 
 // Autoplay button
 divs[36] =  +  * ;
 divs[37] =  +  * ;
 divs[38] =  * ;
 divs[39] =  * ;
 */




/*  for ( int i=4; i<4; i++ ) {
 
 
 //---------------------------------------------//
 //--------------------DIVX---------------------//
 //---------------------------------------------//
 
 
 if ( i%4 == 0  && int(i/4) == 0) {
 // buttonDivX
 divs[i] = appWidth / 100;
 //
 } else if ( i%4 == 0  && int(i/4) == 1) {
 // musicPlayerDivX
 divs[i] = musicPlayerDivX;
 //
 } else if ( i%4 == 0  && int(i/4) == 2) {
 // previousDivX
 divs[i] = musicPlayerDivX + musicPlayerDivWidth * 26/32;
 //
 } else if ( i%4 == 0  && int(i/4) == 3) {
 // rewindTenDivX
 divs[i] = musicPlayerDivX + musicPlayerDivWidth * 7.5/32;
 //
 } else if ( i%4 == 0  && int(i/4) == 4) {
 // playOrPauseButtonDivX
 divs[i] = musicPlayerDivX + musicPlayerDivWidth * 13/32;
 //
 } else if ( i%4 == 0  && int(i/4) == 5) {
 // skipFifteenDivX
 divs[i] = musicPlayerDivX + musicPlayerDivWidth * 20.5/32;
 //
 } else if ( i%4 == 0  && int(i/4) == 6) {
 // nextSongDivX
 divs[i] = musicPlayerDivX + musicPlayerDivWidth * 26/32;
 //
 //
 //
 //
 //
 //
 } else if ( i%4 == 1 && int(i/4) == 0) {
 // buttonDivY
 divs[i] = appHeight * 92.5 / 100;
 //
 } else if ( i%4 == 1  && int(i/4) == 1) {
 } else if ( i%4 == 1  && int(i/4) == 2) {
 } else if ( i%4 == 1  && int(i/4) == 3) {
 } else if ( i%4 == 1  && int(i/4) == 4) {
 } else if ( i%4 == 1  && int(i/4) == 5) {
 } else if ( i%4 == 2 ) {
 divs[i] = appWidth / 5;
 } else if ( i%4 == 3 ) {
 divs[i] = appHeight / 20;
 }
 
 }
 
 for ( int j=0; j<divs.length; j+=4 ) {
 rectDIV(divs[j], divs[j+1], divs[j+2], divs[j+3]);
 }
 
 }
 */

/*
void rectDIV(float x, float y, float w, float h) {
 //DIVs: dividing out the CANVAS in non-overlapping sections
 rect(x, y, w, h);
 }
 */
