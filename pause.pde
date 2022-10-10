void pause() {
  // bg
  image(pause1[pause1F], -100, 0, width+200, height); // img, x, y, width, height
  if (frameCount % 2 == 0) pause1F += 1;
  if (pause1F == pause1NumFrames) pause1F = 0;

  // resume button
  textFont(vcr);
  textSize(45);
  fill(255);
  text("resume", width/2, height/2-190);
  
  // tactile arrow selector
  // resume
  if (mouseX > 320 && mouseX < 475 && mouseY > 205 && mouseY < 230) {
    shape(l, 270, 185, 60, 60);
    shape(r, 470, 185, 60, 60);
  }
  
  // restart 
  text("restart", width/2, height/2+100);
  if (mouseX > 310 && mouseX < 485 && mouseY > 495 && mouseY < 520) {
    shape(l, 257, 475, 60, 60);
    shape(r, 480, 476, 60, 60);
  }
}
