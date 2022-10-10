int vx = 6;
int vy = 6;
int wx = 300;
int wy = 500;
void win() {
  // music
  intro.pause();
  winMusic.play();
  
  // bg
  image(gameOver[gameOverF], 0, 0, width, height); // img, x, y, width, height
  if (frameCount % 2 == 0) gameOverF += 1;
  if (gameOverF == gameOverNumFrames) gameOverF = 0;

  // "you won but at what cost" text
  image(win[winF], wx, wy, 450, 250); // img, x, y, width, height
  winF += 1;
  if (winF == winNumFrames) winF = 0;
  
  // move text diagonally across window
  wx += vx;
  wy += vy;

  // bouncing off edges
  if (wx > width - 420 || wx < -15) vx *= -1;
  if (wy > height - 180 || wy < -50) vy *= -1;
}
