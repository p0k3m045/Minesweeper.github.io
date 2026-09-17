int appWidth;
int appHeight;

float buttonDivX, buttonDivY, buttonDivWidth, buttonDivHeight;

boolean buttonPressed = false;

void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
}

void draw() {
  buttonDivX = appWidth / 100;
  buttonDivY = appHeight * 92.5/100;
  buttonDivWidth = appWidth / 5;
  buttonDivHeight = appHeight / 20;

  rect (buttonDivX, buttonDivY, buttonDivWidth, buttonDivHeight);

  if (buttonPressed == true) {
    musicPlayer();
  }
}

void musicPlayer() {
  fill(100);
}

void mouseClicked() {
  buttonPressed = true;
}
