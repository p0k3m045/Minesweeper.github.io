// Global variables
int numberOfDivs = 10;
int numberOfParameters = 4;
float[] divs = new float[numberOfDivs * numberOfParameters];


void Divs() {

  // --------------------------------------------- //
  //              MUSIC PLAYER BASE                //
  // --------------------------------------------- //

  // Main music player

  /*
    divs[0] = mouseX - dragOffsetX;
   divs[1] = mouseY - dragOffsetY;
   */

  divs[2] = appHeight * 1/2;
  divs[3] = appHeight * 1/2;


  // --------------------------------------------- //
  //                 REFERENT                      //
  // --------------------------------------------- //

  float referent = divs[2] / 64;


  // --------------------------------------------- //
  //                  COLUMNS                      //
  // --------------------------------------------- //

  float column1 = divs[0] + referent * 4;
  float column2 = divs[0] + referent * 15;
  float column3 = divs[0] + referent * 26;
  float column4 = divs[0] + referent * 41;
  float column5 = divs[0] + referent * 52;


  // --------------------------------------------- //
  //                    ROWS                       //
  // --------------------------------------------- //

  float row1 = divs[1] + referent * 2;
  float row2 = divs[1] + referent * 37.5;
  float row3 = divs[1] + referent * 44;
  float row4 = divs[1] + referent * 48;
  float row5 = divs[1] + referent * 50;


  // --------------------------------------------- //
  //              BUILDING THE DIVS                //
  // --------------------------------------------- //

  for (int i=4; i<divs.length; i++) {

    //---------------------------------------------//
    //------------------- DIV X -------------------//
    //---------------------------------------------//

    if (i%4 == 0 && int(i/4) == 1) {

      // Album image
      divs[i] = column2;
    } else if (i%4 == 0 && int(i/4) == 2) {

      // Top-right button
      divs[i] = column5;
    } else if (i%4 == 0 && int(i/4) == 3) {

      // Song title
      divs[i] = column1;
    } else if (i%4 == 0 && int(i/4) == 4) {

      // Progress bar
      divs[i] = column1;
    } else if (i%4 == 0 && int(i/4) == 5) {

      // Previous
      divs[i] = column1;
    } else if (i%4 == 0 && int(i/4) == 6) {

      // Rewind 10
      divs[i] = column2;
    } else if (i%4 == 0 && int(i/4) == 7) {

      // Play / Pause
      // Moved 2 referents to the left because it is larger
      divs[i] = column3;
    } else if (i%4 == 0 && int(i/4) == 8) {

      // Fast Forward
      divs[i] = column4;
    } else if (i%4 == 0 && int(i/4) == 9) {

      // Next
      divs[i] = column5;
    }


    //---------------------------------------------//
    //------------------- DIV Y -------------------//
    //---------------------------------------------//

    if (i%4 == 1 && int(i/4) == 1) {

      // Album image
      divs[i] = row1;
    } else if (i%4 == 1 && int(i/4) == 2) {

      // Top-right button
      divs[i] = row1;
    } else if (i%4 == 1 && int(i/4) == 3) {

      // Song title
      divs[i] = row2;
    } else if (i%4 == 1 && int(i/4) == 4) {

      // Progress bar
      divs[i] = row3;
    } else if (i%4 == 1 && int(i/4) == 7) {

      // Play / Pause
      // Moved 2 referents up because it is larger
      divs[i] = row4;
    } else if (i%4 == 1 && int(i/4) >= 5) {

      // Music buttons
      divs[i] = row5;
    }


    //---------------------------------------------//
    //------------------ DIV WIDTH ----------------//
    //---------------------------------------------//

    if (i%4 == 2 && int(i/4) == 1) {

      // Album image
      divs[i] = referent * 34;
    } else if (i%4 == 2 && int(i/4) == 2) {

      // Top-right button
      divs[i] = referent * 8;
    } else if (i%4 == 2 && int(i/4) == 3) {

      // Song title
      divs[i] = referent * 56;
    } else if (i%4 == 2 && int(i/4) == 4) {

      // Progress bar
      divs[i] = referent * 56;
    } else if (i%4 == 2 && int(i/4) == 7) {

      // Play / Pause
      // Larger than the other buttons
      divs[i] = referent * 12;
    } else if (i%4 == 2 && int(i/4) >= 5) {

      // Other music buttons
      divs[i] = referent * 8;
    } else {

      // Empty Else
    }


    //---------------------------------------------//
    //------------------ DIV HEIGHT ----------------//
    //---------------------------------------------//

    if (i%4 == 3 && int(i/4) == 1) {

      // Album image
      divs[i] = referent * 34;
    } else if (i%4 == 3 && int(i/4) == 2) {

      // Top-right button
      divs[i] = referent * 8;
    } else if (i%4 == 3 && int(i/4) == 3) {

      // Song title
      divs[i] = referent * 5;
    } else if (i%4 == 3 && int(i/4) == 4) {

      // Progress bar
      divs[i] = referent * 2;
    } else if (i%4 == 3 && int(i/4) == 7) {

      // Play / Pause
      // Larger than the other buttons
      divs[i] = referent * 12;
    } else if (i%4 == 3 && int(i/4) >= 5) {

      // Other music buttons
      divs[i] = referent * 8;
    } else {

      // Empty Else
    }


    // Inspect the array
    println(i, divs[i]);
  }


  // --------------------------------------------- //
  //                 DRAW DIVS                     //
  // --------------------------------------------- //

  for (int j=0; j<divs.length; j+=4) {
    rectDIV(divs[j], divs[j+1], divs[j+2], divs[j+3]);
  }
  musicButtonSymbols();
}


// --------------------------------------------- //
//                RECTANGLE CODE                 //
// --------------------------------------------- //

void rectDIV(float x, float y, float w, float h) {

  // DIVs: dividing out the CANVAS
  rect(x, y, w, h);
}
