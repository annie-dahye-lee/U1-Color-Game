void lvl2() {
  image(lvl2[lvl2F], -200, 0, width+380, height); // img, x, y, width, height
  lvl2I += 1;
  if (lvl2F == lvl2NumFrames) lvl2F = 0;

  image(vLine2, width/2-65, 0, 150, height); // vertical line style #2 - glowing

  // pause button
  pause(750, 40, 50, 50);

  // match/unmatch selectors
  textFont(viper2);
  textSize(50);
  fill(white);
  VTactileText(0, 381);
  text("UNMATCH", 200, height/2); // UNMATCH, LEFT

  VTactileText(413, width);
  text("MATCH", 580, height/2); // MATCH, RIGHT

  // score
  fill(255);
  textFont(vcr);
  textSize(40);
  text(score, 100, 50);

  puzzle(lvl2V, viper, 60); // text velocity, font, size

  // if text reaches bottom of screen, gameover
  if (y >= height + 50) mode = GAMEOVER;
  if (score < 0) {
    score = 0;
    mode = GAMEOVER;
  }

  if (gamemode == 2 && score >= 35) mode = LVL3; // score must be minimum 30 to reach next level
}
