// Annie Lee
// Sept 26, 2022
// CO1ORPUNK

// import audio library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// MODE VARIABLES
int mode;
final int INTRO = 0;
final int OPTIONS = 1;
final int LOADING = 2;
final int GAME = 3;
final int LVL1 = 4;
final int LVL2 = 5;
final int LVL3 = 6;
final int PAUSE = 7;
final int GAMEOVER = 8;
final int WIN = 9;

int gamemode = 2; // 1 = classic, 2 = challenge

// COLOR PALETTE
color pink = #ff00c1;
color red = #ff0000;
color green = #80ffdb;
color blue = #4900ff;
color blue2 = #153CB4;
color purple = #f222ff;
color orange = #ff901f;

color black = 0;
color white = 255;
color grey = #dddddd;
color selected = #ffd319;

// BOOLEANS
boolean isMatch;

// GIFS
int bgNumFrames = 44;
PImage[] bg = new PImage[bgNumFrames];
int bgF = 0;
int bgI = 0;

int titleNumFrames = 49;
PImage[] title = new PImage[titleNumFrames];
int tF = 0;
int tI = 0;

int loadNumFrames = 146;
PImage[] load = new PImage[loadNumFrames];
int lF = 0;
int lI = 0;

int loadBgNumFrames = 70;
PImage[] loadBg = new PImage[loadBgNumFrames];
int lBgF = 0;
int lBgI = 0;

int pause1NumFrames = 145;
PImage[] pause1 = new PImage[pause1NumFrames];
int pause1F = 0;
int pause1I = 0;

int flatlinedNumFrames = 49;
PImage[] flatlined = new PImage[flatlinedNumFrames];
int flatlinedF = 0;
int flatlinedI = 0;

int game1NumFrames = 29;
PImage[] game1 = new PImage[game1NumFrames];
int game1F = 0;
int game1I = 0;

int lvl1NumFrames = 200;
PImage[] lvl1 = new PImage[lvl1NumFrames];
int lvl1F = 0;
int lvl1I = 0;

int lvl2NumFrames = 182;
PImage[] lvl2 = new PImage[lvl2NumFrames];
int lvl2F = 0;
int lvl2I = 0;

int lvl3NumFrames = 45;
PImage[] lvl3 = new PImage[lvl3NumFrames];
int lvl3F = 0;
int lvl3I = 0;

int winNumFrames = 75;
PImage[] win = new PImage[winNumFrames];
int winF = 0;
int winI = 0;

int gameOverNumFrames = 19;
PImage[] gameOver = new PImage[gameOverNumFrames];
int gameOverF = 0;
int gameOverI = 0;

int optionsBgNumFrames = 30;
PImage[] optionsBg = new PImage[optionsBgNumFrames];
int optionsBgF = 0;
int optionsBgI = 0;

// FONT
PFont vcr;
PFont alien;
PFont viper;
PFont viper2;
PFont bluescreen;
PFont glitch;
PFont wave;
PFont digital;

// IMG
PImage vGlitchLine;
PImage vLine2;
PImage hLine;
PImage pause;
PImage blackScreen;
PImage H_straightLine;

int timer1 = 0;
int score = 0;
int highScore = 0;

// RANDOM GENERATORS
int randomWord = (int) random(0, 6); // cast random int 0 to 5
int randomColor = (int) random(0, 6);
int randomEdge = (int) random(0, 6);
float chance = random(0, 1);
float y = -120;
float x = random(100, 650);
float gameV = random(11, 15);
float lvl1V = random(15, 19);
float lvl2V = random(19, 23);
float lvl3V = random(23, 28);

// WORDS & COLOR
String[] words = {"PINK", "BLUE", "GREEN", "PURPLE", "RED", "ORANGE", "ORANGE"};
color[] colors = {pink, blue, green, purple, red, orange, orange};

// MUSIC
Minim minim = new Minim(this);
AudioPlayer intro, options, pauseBGM, gameover, winMusic;

// arrow selectors
PShape r;
PShape l;

// setup
void setup() {
  size(800, 800); // game window
  mode = LVL3;   // start at intro screen

  // load song files
  intro = minim.loadFile("intro.mp3");
  options = minim.loadFile("options.mp3");
  gameover = minim.loadFile("gameover.mp3");
  winMusic = minim.loadFile("win.mp3");

  // center text and rects
  textAlign(CENTER, CENTER);
  rectMode(CENTER); // rects' coordinates are from center, not longer top left corner

  // GIFS
  // intro bg gif
  while (bgI < bgNumFrames) {
    bg[bgI] = loadImage("frame_" + bgI + "_delay-0.03s.gif");
    bgI++;
  }

  // intro title gif
  while (tI < titleNumFrames) {
    title[tI] = loadImage("frame_" + tI + "_delay-0.04s.gif");
    tI++;
  }

  // loading bar
  while (lI < loadNumFrames) {
    if (lI < 100) load[lI] = loadImage("frame_0" + lI + "_delay-0.05s.png");
    else load[lI] = loadImage("frame_" + lI + "_delay-0.05s.png");
    lI++;
  }

  // loading screen background
  while (lBgI < loadBgNumFrames) {
    loadBg[lBgI] = loadImage("frame_" + lBgI + "_delay-0.08s.gif");
    lBgI++;
  }

  // pause screen background
  while (pause1I < pause1NumFrames) {
    if (pause1I < 100) pause1[pause1I] = loadImage("frame_0" + pause1I + "_delay-0.05s.gif");
    else pause1[pause1I] = loadImage("frame_" + pause1I + "_delay-0.05s.gif");
    pause1I++;
  }

  // gameover "flatlined"
  while (flatlinedI < flatlinedNumFrames) {
    flatlined[flatlinedI] = loadImage(flatlinedI + ".gif");
    flatlinedI++;
  }

  // game bg
  while (game1I < game1NumFrames) {
    game1[game1I] = loadImage("fnum" + game1I + ".png");
    game1I++;
  }

  // lvl1 bg
  while (lvl1I < lvl1NumFrames) {
    if (lvl1I < 100) lvl1[lvl1I] = loadImage("frame_0" + lvl1I + "_delay-0.01s.gif");
    else lvl1[lvl1I] = loadImage("frame_" + lvl1I + "_delay-0.01s.gif");
    lvl1I++;
  }

  //vl2 bg
  while (lvl2I < lvl2NumFrames) {
    lvl2[lvl2I] = loadImage("fnum" + lvl2I + ".gif");
    lvl2I++;
  }

  //lvl3 bg
  while (lvl3I < lvl3NumFrames) {
    //if (lvl3I < 10) lvl3[lvl3I] = loadImage("frame_0" + lvl3I + "_delay-0.07s.gif");
    lvl3[lvl3I] = loadImage("frame_" + lvl3I + "_delay-0.07s.gif");
    lvl3I++;
  }

  // win bg
  while (winI < winNumFrames) {
    win[winI] = loadImage("frame_" + winI + "_delay-0.04s.png");
    winI++;
  }

  // gameover bg
  while (gameOverI < gameOverNumFrames) {
    gameOver[gameOverI] = loadImage("frame_" + gameOverI + "_delay-0.1s.jpg");
    gameOverI++;
  }

  // options bg
  while (optionsBgI < optionsBgNumFrames) {
    if (optionsBgI < 10) optionsBg[optionsBgI] = loadImage("frame_0" + optionsBgI + "_delay-0.03s.png");
    else optionsBg[optionsBgI] = loadImage("frame_" + optionsBgI + "_delay-0.03s.png");
    optionsBgI++;
  }

  // create fonts
  vcr = createFont("vcr.ttf", 100);
  alien = createFont("alien.ttf", 100);
  viper = createFont("viper.ttf", 100);
  viper2 = createFont("viper2.ttf", 100);
  bluescreen = createFont("bluescreen.ttf", 100);
  glitch = createFont("glitch.ttf", 100);
  wave = createFont("wave.ttf", 100);
  digital = createFont("digital2.ttf", 100);

  // load images
  vGlitchLine = loadImage("line.png");
  vLine2 = loadImage("glowVLine.png");
  hLine = loadImage("hLine.png");
  pause = loadImage("pause.png");
  blackScreen = loadImage("black.jpeg");
  H_straightLine = loadImage("H_straightLine.png");

  // PShape arrow selector
  l = loadShape("left.svg");
  r = loadShape("right.svg");
}

// draw
void draw() {
  if (mode == INTRO) intro();
  else if (mode == OPTIONS) options();
  else if (mode == LOADING) loading();
  else if (mode == GAME) game();
  else if (mode == LVL1) lvl1();
  else if (mode == LVL2) lvl2();
  else if (mode == LVL3) lvl3();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameover();
  else if (mode == WIN) win();
  else println("Error: Mode = " + mode);
}

// puzzle
void puzzle(float v, PFont font, int size) {
  if (chance > 0.5) { // 50% chance of matching
    isMatch = true;
    randomWord = randomColor;
  } else { // 50% chance of unmatching
    isMatch = false;
    while (randomWord == randomColor) { // verify randomWord != randomColor
      if (randomWord == words.length - 1) randomWord = randomEdge;
      else randomWord++;
    }
  }

  // selected text falling down
  textFont(font);
  textSize(size);
  fill(colors[randomColor]);
  text(words[randomWord], x, y);
  y += v; // specified velocity of text

  if (score > highScore) highScore = score;
  println(highScore);
}

// generates random numebers
void randomNum() {
  x = random(160, 650);
  randomWord = (int) random(0, 3); // random int between 0 to 2
  randomColor = (int) random(0, 3);
  chance = random(0, 1);
  gameV = random(8, 12);
}
