void intro() {
  options.pause();
  intro.play();

  // bg
  image(bg[bgF], 0, 0, width, height); // img, x, y, width, height
  bgF += 1;
  if (bgF == bgNumFrames) bgF = 0;

  // CO1ORPUNK title
  image(title[tF], 100, 200, 600, 150); // img, x, y, width, height
  if (frameCount % 2 == 0) tF += 1;
  if (tF == titleNumFrames) tF = 0;

  // intro buttons
  textFont(vcr);
  textSize(45);
  fill(#dddddd);
  text("PLAY", width/2, height-130);   // play
  text("OPTIONS", width/2, height-70); // options

  // play arrow selector
  if (mouseX > 350 && mouseX < 450 && mouseY > 650 && mouseY < 690) {
    shape(r, 441, height-158, 60, 60);
    shape(l, 297, height-158, 60, 60);
  }

  // options arrow selector
  if (mouseX > 303 & mouseX < 490 && mouseY > 710 && mouseY < 750) {
    shape(l, 260, 703, 60, 60);
    shape(r, 480, 703, 60, 60);
  }
}
