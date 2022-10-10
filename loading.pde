void loading() {
  intro.pause();
  options.play();

  image(blackScreen, 0, 0, width, height); // black bg
  
  // bg gif
  image(loadBg[lBgF], 00, 110, width+50, height); // img, x, y, width, height
  lBgF += 1;
  if (lBgF == loadBgNumFrames) lBgF = 0;

  // loading bar
  image(load[lF], 75, 0, 650, 400); // img, x, y, width, height
  lF += 1;
  if (lF == loadNumFrames) lF = 0;
  
  // load then start game
  timer1++;
  if (timer1 == 147) mode = GAME;
}
