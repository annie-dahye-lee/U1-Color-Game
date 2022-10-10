void gameover() {
  // music
  intro.pause();
  options.pause();
  gameover.play();

  background(blue); // background

  // flatlined text
  image(flatlined[flatlinedF], 100, 150, 600, 150); // img, x, y, width, height
  flatlinedF += 1;
  if (flatlinedF == flatlinedNumFrames) flatlinedF = 0;

  // display score
  fill(white);
  textFont(vcr);
  textSize(60);
  text("score:" + score, width/2, height/2-50); // score
  text("high score:" + highScore, width/2, height/2+50); // high score

  // retry button
  noStroke();
  fill(white);
  tactileRect(90, 600, 250, 50);
  rect(220, 620, 250, 50, 20);

  textSize(40);
  fill(black);
  text("retry", 220, 618);

  // main menu button
  fill(white);
  tactileRect(420, 600, 320, 50);
  rect(580, 620, 320, 50, 20);

  textSize(40);
  fill(black);
  text("main menu", 580, 618);
}
