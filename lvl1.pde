void lvl1() {
  // bg
  image(lvl1[lvl1F], -300, 0, width+400, height); 
  lvl1F += 1;
  if (lvl1F == lvl1NumFrames) lvl1F = 0;

  // pause button
  pause(750, 40, 50, 50);

  // match/unmatch selectors
  textFont(vcr);
  textSize(60);
  fill(#dddddd);
  HTactileText(0, 400);
  text("UNMATCH", 210, height/2-200); // UNMATCH, UP

  HTactileText(400, height);
  text("MATCH", 600, height/2+220); // MATCH, DOWN

  image(H_straightLine, -200, height/2-50, width+400, 80); // horizonal default line

  // score
  fill(255);
  textFont(vcr);
  textSize(40);
  text(score, 70, 55);
  puzzle(lvl1V, digital, 80); // text velocity, font, size

  // if text reaches bottom of screen, gameover
  if (y >= height + 50) mode = GAMEOVER;
  if (score < 0) {
    score = 0;
    mode = GAMEOVER;
  }
  if (gamemode == 2 && score >= 25) mode = LVL2; // score must be minimum 20 to reach next level
}
