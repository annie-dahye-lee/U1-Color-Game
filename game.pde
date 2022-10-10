void game() { //<>//
  options.pause();
  intro.play();
  
  // bg
  image(game1[game1F], -100, 0, width+200, height); // img, x, y, width, height
  game1F += 1;
  if (game1F == game1NumFrames) game1F = 0;

  image(vLine2, width/2-65, 0, 150, height); // vertical line

  // pause button
  pause(750, 40, 50, 50);

  // match/unmatch selectors
  textFont(vcr);
  textSize(50);
  fill(grey);
  VTactileText(0, 381);
  text("UNMATCH", 200, height/2); // unmatch

  VTactileText(413, width);
  text("MATCH", 580, height/2);   // match

  // score
  fill(255);
  textSize(50);
  text(score, 100, 50);

  puzzle(gameV, bluescreen, 90); // text velocity, font, size

  // if text reaches bottom of screen, gameover
  if (y >= height + 50) {
    y = -300;
    mode = GAMEOVER;
  }
  if (score < 0) score = 0;

  if (gamemode == 2 && score >= 10) mode = LVL1; // score must be minimum 10 to reach next level
}

// pause button
void pause(int x, int y, int w, int h) {
  fill(0);
  noStroke();
  tactileCircle(x, y, w);
  circle(x, y, w+10);
  image(pause, x-25, y-23, w, h);
}
