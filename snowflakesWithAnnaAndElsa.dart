turnRight(45);
for (var count3 = 0; count3 < 6; count3++) {
  for (var count = 0; count < 3; count++) {
      turnLeft(45);
    moveForward(24);
    turnRight(45);
    moveForward(23);
  }
  for (var count2 = 0; count2 < 6; count2++) {
      moveForward(15);
    turnLeft(60);
  }
  turnLeft(60);
  jumpTo(13);
}
turnRight(15);
for (var count5 = 0; count5 < 6; count5++) {
  for (var count4 = 0; count4 < 4; count4++) {
      moveForward(50);
    turnRight(90);
  }
  turnLeft(60);
  jumpTo(13);
}
