// keyboard
void keyPressed() {
  if (keyCode == ' ' && mode == PAUSE) mode = GAME;
  keyPressesL(GAME, gameV);
  keyPressesL(LVL2, lvl2V);

  keyPressesR(LVL1, lvl1V);
  keyPressesR(LVL3, lvl3V);
}

// for levels with vertical lines
void keyPressesL(int mode1, float v) {
  if (mode == mode1) {
    if (keyCode == LEFT) unmatch(v);
    if (keyCode == RIGHT) match1(v);
  }
}

// for levels with horizontal lines
void keyPressesR(int mode1, float v) {
  if (mode == mode1) {
    if (keyCode == UP) unmatch(v);
    if (keyCode == DOWN) match1(v);
  }
}

// mouse clicks
void mousePressed() {
  // INTRO play/start
  if (mode == INTRO && mouseX > 350 && mouseX < 450 && mouseY > 650 && mouseY < 690) {
    mode = LOADING;
  }
  // INTRO options menu
  if (mode == INTRO && mouseX > 303 & mouseX < 490 && mouseY > 710 && mouseY < 750) mode = OPTIONS;

  // GAME & LVL2 vertical orientation
  if ((mode == GAME || mode == LVL2) && mouseX > 0 & mouseX < 380) unmatch(gameV);    // unmatch
  if ((mode == GAME || mode == LVL2) && mouseX > 410 & mouseX < width) match1(gameV); // match

  // PAUSE
  if (mouseX > 720 && mouseX < 781 && mouseY > 10 && mouseY < 75) mode = PAUSE;                   // pause button
  if (mode == PAUSE && mouseX > 320 && mouseX < 475 && mouseY > 205 && mouseY < 230) mode = GAME; // resume
  if (mode == PAUSE && mouseX > 310 && mouseX < 485 && mouseY > 495 && mouseY < 520) {            // intro/main menu
    mode = INTRO;
    score = 0;
  }

  // LVL1 & LVL3 horizontal orientation
  if ((mode == LVL1 || mode == LVL3) && mouseY > 0 & mouseY < 400) unmatch(lvl1V);     // unmatch
  if ((mode == LVL1 || mode == LVL3) && mouseY > 400 & mouseY < height) match1(lvl1V); // match

  // GAMEOVER
  if (mode == GAMEOVER && mouseX > 420 && mouseX < 740 && mouseY > 600 && mouseY < 650) { // main menu/intro
    gameover.pause();
    mode = INTRO;
  }
  if (mode == GAMEOVER && mouseX > 95 && mouseX < 345 && mouseY > 600 && mouseY < 650) {  // retry/new game
    gameover.pause();
    mode = GAME;
    score = 0;
  }

  // OPTIONS
  // gamemode 1 = classic
  if (mode == OPTIONS && mouseX > 300 && mouseX < 440 && mouseY > 130 && mouseY < 160) {
    gamemode = 1;
    mode = INTRO;
  }
  // gamemode 2 = challenge
  if (mode == OPTIONS && mouseX > 280 && mouseX < 465 && mouseY > 270 && mouseY < 300) {
    gamemode = 2;
    mode = INTRO;
  }
}

// TACTILE
void tactileCircle(int x, int y, int d) {
  if (dist(mouseX, mouseY, x, y) < d/2+10) {
    fill(255);
  }
}

void HTactileText(int y1, int y2) {
  if (mouseY > y1 && mouseY < y2) fill(selected);
  else fill(white);
}

void VTactileText(int x1, int x2) {
  if (mouseX > x1 && mouseX < x2) fill(selected);
  else fill(white);
}

void tactileRect(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) fill(#ECECEC);
  else fill(white);
}

// MATCH/UNMATCH
void match1(float v) {
  if (isMatch) score++;
  if (!isMatch) score--;
  randomNum();
  y = -120;
  puzzle(v, viper2, 70);
}

void unmatch(float v) {
  if (!isMatch) score++;
  if (isMatch) score--;
  randomNum();
  y = -120;
  puzzle(v, viper2, 70);
}
