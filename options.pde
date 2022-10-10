float angle1 = radians(-4); 

void options() {
  intro.pause();
  options.play();
  
  // bg 
  image(optionsBg[optionsBgF], 0, 0, width, height); // img, x, y, width, height
  optionsBgF += 1;
  if (optionsBgF == optionsBgNumFrames) optionsBgF = 0;

  // classic mode
  pushMatrix();
  textFont(bluescreen);
  textSize(40);
  fill(blue2);
  rotate(angle1); // adjust rotation of text
  text("classic", 360, 165);
  textSize(20);
  text("the  endless  Void", 350, 210); // classic mode description

  // challenge/leveled mode
  textSize(40);
  fill(blue2);
  text("challenge", 350, 300);
  textSize(20);
  text("complete levels to win", 350, 350); // challenge mode descriptions

  // tactile arrow mode selector 
  // challenge
  if (mouseX > 300 && mouseX < 440 && mouseY > 130 && mouseY < 165) {
    shape(r, 420, 145, 60, 60);
    shape(l, 240, 145, 60, 60);
  }

  // classic
  if (mouseX > 280 && mouseX < 465 && mouseY > 270 && mouseY < 300) {
    shape(l, 210, 280, 60, 60);
    shape(r, 434, 280, 60, 60);
  }
  popMatrix();
}
