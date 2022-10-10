void lvl3() {
  image(lvl3[lvl3F], 0, 0, width, height); // img, x, y, width, height
  lvl3F += 1;
  if (lvl3F == lvl3NumFrames) lvl3F = 0;

  // pause button
  pause(750, 40, 50, 50);

  // match/unmatch selectors
  textFont(alien);
  textSize(60);
  fill(#dddddd);
  HTactileText(0, 400);
  text("UNMATCH", 190, height/2-250); // UNMATCH, UP

  HTactileText(400, height);
  text("MATCH", 600, height/2+220); // MATCH, DOWN

  image(hLine, -80, height/2-250, width+100, 500); // horizontal default line

  // score
  fill(255);
  textFont(vcr);
  textSize(40);
  text(score, 100, 50);

  puzzle(lvl3V, viper2, 70); // text velocity, font, size

  // if text reaches bottom of screen, gameover
  if (y >= height + 50) mode = GAMEOVER;
  if (score < 0) {
    score = 0;
    mode = GAMEOVER;
  }
  if (gamemode == 2 && score >= 40) mode = WIN; // score must be minimum 34 to win
}
