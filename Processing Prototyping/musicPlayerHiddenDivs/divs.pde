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
  divs[8] = divs[4] + musicPlayerDivWidth * 26/32;
  divs[9] = divs[5] + musicPlayerDivHeight * 25/32;
  divs[10] = musicPlayerDivWidth * 4/32;
  divs[11] = musicPlayerDivHeight * 4/32;
  
  // Back 10
  divs[12] = divs[4] + divs[6] * 7.5/32;
  divs[13] = divs[5] + divs[6] * 25/32;
  divs[14] = 
  divs[15] = 
}
