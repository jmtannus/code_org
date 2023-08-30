for (var count3 = 0; count3 < 6; count3++) {
  for (var count = 0; count < 6; count++) {
      moveForward(50);
    turnRight(60);
  }
  turnRight(60);
  moveForward(150);
  for (var count2 = 0; count2 < 4; count2++) {
      moveForward(15);
    turnLeft(90);
  }
  jumpTo(13);
}
