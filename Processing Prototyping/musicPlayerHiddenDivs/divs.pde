// Global variables
int numberOfDivs = 7;
int numberOfParameters = 4;
float[] divs = new float[numberOfDivs * numberOfParameters];

void Divs() {
  // Button
  divs[0] = appWidth / 100;
  divs[1] = appHeight * 92.5 / 100;
  divs[2] = appWidth / 5;
  divs[3] = appHeight / 20;

  // Music player
  divs[4] = mouseX - dragOffsetX;
  divs[5] = mouseY - dragOffsetY;
  divs[6] = appHeight / 2;
  divs[7] = appHeight / 2;

  // Previous song
  divs[8] = divs[4] + divs[6] * 26/32;
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

  for ( int i=0; i<4; i++ ) {
    if ( i%4 == 0  && int(i/4) == 0) {
      divs[i] = appWidth / 100;
      
    } else if ( i%4 == 0  && int(i/4) == 1) {
      divs[i] = mouseX - dragOffsetX;
      
    } else if ( i%4 == 0  && int(i/4) == 2) {
      divs[i] = divs[4] + divs[6] * 26/32;
      
    } else if ( i%4 == 0  && int(i/4) == 3) {
    } else if ( i%4 == 0  && int(i/4) == 4) {
    } else if ( i%4 == 0  && int(i/4) == 5) {






      if ( i%4 == 1) {
        divs[i] = appHeight * 92.5 / 100;
      }






      if ( i%4 == 2 ) {
        divs[i] = appWidth / 5;
      }






      if ( i%4 == 3 ) {
        divs[i] = appHeight / 20;
      }
    }
