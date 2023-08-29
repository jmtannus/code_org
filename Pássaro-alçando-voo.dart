function moving_east(this_sprite) {
  moveInDirection(this_sprite, 3, "East");
}

function moving_north(this_sprite) {
  moveInDirection(this_sprite, 2, "North");
}

function patrolling(this_sprite) {
  moveForward(this_sprite, 5);
  if (getProp(this_sprite, "x") > 350 || getProp(this_sprite, "x") < 50) {
    changePropBy(this_sprite, "direction", 180);
  }
  if (getProp(this_sprite, "direction") < 90 || getProp(this_sprite, "direction") > 270) {
    mirrorSprite(this_sprite, "right");
  } else {
    mirrorSprite(this_sprite, "left");
  }

}

function moving_with_arrow_keys(this_sprite) {
  if (isKeyPressed("up")) {
    moveInDirection(this_sprite, 5, "North");
  }
  if (isKeyPressed("down")) {
    moveInDirection(this_sprite, 5, "South");
  }
  if (isKeyPressed("left")) {
    moveInDirection(this_sprite, 5, "West");
  }
  if (isKeyPressed("right")) {
    moveInDirection(this_sprite, 5, "East");
  }
}

function math_random_int(a, b) {
  if (a > b) {
    // Swap a and b to ensure a is smaller.
    var c = a;
    a = b;
    b = c;
  }
  return Math.floor(Math.random() * (b - a + 1) + a);
}

function wobbling(this_sprite) {
  setProp(this_sprite, "rotation", math_random_int(-1, 1));
}

function moving_forward(this_sprite) {
  moveForward(this_sprite, 5);
}

function growing(this_sprite) {
  changePropBy(this_sprite, "scale", 1);
}

function moving_west(this_sprite) {
  moveInDirection(this_sprite, 5, "West");
}

function spinning_right(this_sprite) {
  turn(this_sprite, 6, "right");
}

function moving_south(this_sprite) {
  moveInDirection(this_sprite, 5, "South");
}

function jittering(this_sprite) {
  changePropBy(this_sprite, "scale", math_random_int(-1, 1));
}

function wandering(this_sprite) {
  if (math_random_int(0, 5) == 0) {
    changePropBy(this_sprite, "direction", math_random_int(-25, 25));
  }
  moveForward(this_sprite, 1);
  if (isTouchingEdges(this_sprite)) {
    edgesDisplace(this_sprite);
    changePropBy(this_sprite, "direction", math_random_int(135, 225));
  }
}

function shrinking(this_sprite) {
  changePropBy(this_sprite, "scale", -1);
}

function spinning_left(this_sprite) {
  turn(this_sprite, 6, "left");
}

function driving_with_arrow_keys(this_sprite) {
  if (isKeyPressed("up")) {
    moveForward(this_sprite, 5);
  }
  if (isKeyPressed("down")) {
    moveBackward(this_sprite, 5);
  }
  if (isKeyPressed("left")) {
    changePropBy(this_sprite, "direction", -5);
    changePropBy(this_sprite, "rotation", -5);
  }
  if (isKeyPressed("right")) {
    changePropBy(this_sprite, "direction", 5);
    changePropBy(this_sprite, "rotation", 5);
  }
  if (isTouchingEdges(this_sprite)) {
    edgesDisplace(this_sprite);
  }
}

function fluttering(this_sprite) {
  changePropBy(this_sprite, "y", math_random_int(-1, 1));
}

function moving_west_and_looping(this_sprite) {
  mirrorSprite(this_sprite, "left");
  moveInDirection(this_sprite, 5, "West");
  if (getProp(this_sprite, "x") < -50) {
    setProp(this_sprite, "x", 450);
  }
}

function moving_east_and_looping(this_sprite) {
  mirrorSprite(this_sprite, "right");
  moveInDirection(this_sprite, 5, "East");
  if (getProp(this_sprite, "x") > 450) {
    setProp(this_sprite, "x", -50);
  }
}

setBackgroundImageAs("bg_landscape06_1");
makeNewSpriteAnon("birdside_04_1", ({"x":50,"y":350}));
setProp(({costume: "birdside_04_1"}), "scale", 75);
addBehaviorSimple(({costume: "birdside_04_1"}), new Behavior(wobbling, []));
addBehaviorSimple(({costume: "birdside_04_1"}), new Behavior(moving_east, []));

atTime(2, "seconds", function (extraArgs) {
  removeAllBehaviors(({costume: "birdside_04_1"}));
  addBehaviorSimple(({costume: "birdside_04_1"}), new Behavior(patrolling, []));
  addBehaviorSimple(({costume: "birdside_04_1"}), new Behavior(moving_north, []));
  addBehaviorSimple(({costume: "birdside_04_1"}), new Behavior(fluttering, []));
});
OK
