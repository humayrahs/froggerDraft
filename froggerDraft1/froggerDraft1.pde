int fXPos, fYPos, fSize, fSpeed, cSpeed;
float cXSize, cYSize;
float [] cXPos, cYPos;

void setup() {
  size(1200, 500);
  initGame();

  for (int i=0; i<cXPos.length; i++) {
    initCar(i);
  }
}

void draw() {
  background(100);
  drawFrog();
  moveFrog();
  checkFrog();

  for (int i=0; i<cXPos.length; i++) {
    displayCar(i);
    moveCar(i);
    checkCar(i);
  }
}

void initGame() {
  //Frog
  fXPos = width/2;
  fYPos = fSize;
  fSize = 20;
  fSpeed = 5;

  //Cars
  cSpeed = 3;
  cXSize = 40;
  cYSize = 30;

  int noCars = 40;
  cXPos = new float[noCars];
  cYPos = new float[noCars];
}

void drawFrog() {
  //frog 40x40
  stroke(0);
  fill(120, 255, 120);
  square(fXPos, fYPos, fSize);
}

void moveFrog() {
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        fXPos += fSpeed;
      } else if (keyCode == LEFT) {
        fXPos -= fSpeed;
      } else if (keyCode == UP) {
        fYPos -= fSpeed;
      } else if (keyCode == DOWN) {
        fYPos += fSpeed;
      }
    }
  }
}

void checkFrog() {
  if (fXPos+fSize>width) {
    fXPos = width-fSize;
  } else if (fXPos<0) {
    fXPos = 0;
  } else if (fYPos<0) {
    fYPos = 0;
  } else if (fYPos > height-fSize) {
    fYPos = height-fSize;
  }
}

void initCar(int i) {
  int rows = height/11;
  cXPos[i] = -random(width);
  cYPos[i] = rows*int(random(11));
}

void displayCar(int i) {
  fill(255);
  rect(cXPos[i], cYPos[i], cXSize, cYSize);
}

void moveCar(int i) {
  cXPos[i]+=cSpeed;
}

void checkCar(int i) {
  if (cXPos[i]>width) {
    initCar(i);
  }
}

void checkCollision(int i) {
  /*if ftopleft->ftopright > cbottomleft->bottomright 
  OR ftopright->fbottomright > ctopleft->cbottom left
  OR fbottomleft->fbottomright > ctopleft->ctopright
  OR ftopleft->fbottomleft > ctopright->cbottomright*/
  //float for c and int for f
  
}
