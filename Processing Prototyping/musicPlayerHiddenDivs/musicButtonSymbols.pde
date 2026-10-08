// --------------------------------------------- //
//            MUSIC BUTTON SYMBOLS               //
// --------------------------------------------- //


void musicButtonSymbols() {

  // Previous
  musicSymbol(3, divs[20], divs[21], divs[22]);

  // Rewind 10
  musicSymbol(4, divs[24], divs[25], divs[26]);

  // Play
  musicSymbol(6, divs[28], divs[29], divs[30]);

  // Fast Forward
  musicSymbol(9, divs[32], divs[33], divs[34]);

  // Next
  musicSymbol(10, divs[36], divs[37], divs[38]);
}


// --------------------------------------------- //
//              MUSIC SYMBOL CODE                //
// --------------------------------------------- //

void musicSymbol(int index, float divX, float divY, float divDimension) {

  divX = smallerNum(divX, divDimension);
  divY = smallerNum(divY, divDimension);
  divDimension = smallerNum(divDimension);


  if (index==5 || index==6 || index==9 || index==10 || index==11) {

    // No Square

  } else if (index==3 || index==4) {

    // No Square & Reverse Triangle
    divX = divX + divDimension;

  } else {

    drawMusicDivs(divX, divY, divDimension);
  }


  if (index==2 || index==11) {

    drawLines(divX, divY, divDimension);
  }


  // --------------------------------------------- //
  //                   PREVIOUS                    //
  // --------------------------------------------- //

  if (index==3) {

    drawNarrowTriangle(
      -1,
      divX,
      divY,
      divDimension
      );

    drawRectangle(
      1,
      divX-divDimension*3/4,
      divY,
      divDimension,
      divDimension
      );
  }


  // --------------------------------------------- //
  //                   REWIND                     //
  // --------------------------------------------- //

  if (index==4) {

    drawNarrowTriangle(
      -1,
      divX,
      divY,
      divDimension
      );

    drawNarrowTriangle(
      -1,
      divX-smallerNum(divDimension),
      divY,
      divDimension
      );
  }


  // --------------------------------------------- //
  //                    PAUSE                      //
  // --------------------------------------------- //

  if (index==5) {

    drawRectangle(
      1,
      divX,
      divY,
      divDimension,
      divDimension
      );

    drawRectangle(
      -1,
      divX,
      divY,
      divDimension,
      divDimension
      );
  }


  // --------------------------------------------- //
  //                     PLAY                      //
  // --------------------------------------------- //

  if (index==6) {

    drawWideTriangle(
      divX,
      divY,
      divDimension
      );
  }


  // --------------------------------------------- //
  //                FAST FORWARD                  //
  // --------------------------------------------- //

  if (index==9) {

    drawNarrowTriangle(
      1,
      divX,
      divY,
      divDimension
      );

    drawNarrowTriangle(
      1,
      divX+smallerNum(divDimension),
      divY,
      divDimension
      );
  }


  // --------------------------------------------- //
  //                     NEXT                      //
  // --------------------------------------------- //

  if (index==10) {

    drawNarrowTriangle(
      1,
      divX,
      divY,
      divDimension
      );

    drawRectangle(
      1,
      divX+smallerNum(divDimension),
      divY,
      divDimension,
      divDimension
      );
  }
}


// --------------------------------------------- //
//               SMALLER NUMBER                  //
// --------------------------------------------- //

float smallerNum(float divXY, float divDimension) {

  return divXY + divDimension*1/4;
}


float smallerNum(float divDimension) {

  return divDimension*1/2;
}


// --------------------------------------------- //
//                    LINES                      //
// --------------------------------------------- //

void drawLines(
  float divX,
  float divY,
  float divDimension) {

  line(
    divX,
    divY,
    divX+divDimension,
    divY+divDimension
    );

  line(
    divX+divDimension,
    divY,
    divX,
    divY+divDimension
    );
}


// --------------------------------------------- //
//                WIDE TRIANGLE                  //
// --------------------------------------------- //

void drawWideTriangle(
  float divX,
  float divY,
  float divDimension) {

  triangle(
    divX,
    divY,
    divX+divDimension,
    divY+smallerNum(divDimension),
    divX,
    divY+divDimension
    );
}


// --------------------------------------------- //
//               NARROW TRIANGLE                 //
// --------------------------------------------- //

void drawNarrowTriangle(
  int reverse,
  float divX,
  float divY,
  float divDimension) {

  triangle(
    divX,
    divY,
    divX+reverse*smallerNum(divDimension),
    divY+smallerNum(divDimension),
    divX,
    divY+divDimension
    );
}


// --------------------------------------------- //
//                  RECTANGLE                    //
// --------------------------------------------- //

void drawRectangle(
  int reverse,
  float x,
  float y,
  float w,
  float h) {

  if (reverse==-1) {

    x = x+w-w*1/4;
  }

  rect(
    x,
    y,
    w*1/4,
    h
    );
}


// --------------------------------------------- //
//                MUSIC DIVS                     //
// --------------------------------------------- //

void drawMusicDivs(
  float x,
  float y,
  float d) {

  rect(
    x,
    y,
    d,
    d
    );
}
