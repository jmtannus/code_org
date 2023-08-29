function patrolling(this_sprite) {
  moveForward(this_sprite, getProp(this_sprite, "speed"));
  if (isTouchingEdges(this_sprite)) {
    edgesDisplace(this_sprite);
    changePropBy(this_sprite, "direction", 180);
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

function moving_east(this_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "speed"), "East");
}

function spinning_left(this_sprite) {
  turn(this_sprite, 6, "left");
}

function spinning_right(this_sprite) {
  turn(this_sprite, 6, "right");
}

function shrinking(this_sprite) {
  changePropBy(this_sprite, "scale", -1);
}

function growing(this_sprite) {
  changePropBy(this_sprite, "scale", 1);
}

function moving_south(this_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "speed"), "South");
}

function swimming_left_and_right(this_sprite) {
  if (getProp(this_sprite, "direction") == 0) {
    mirrorSprite(this_sprite, "right");
  } else if (getProp(this_sprite, "direction") == 180) {
    mirrorSprite(this_sprite, "left");
  }
  moveForward(this_sprite, getProp(this_sprite, "speed"));
  if (isTouchingEdges(this_sprite)) {
    edgesDisplace(this_sprite);
    changePropBy(this_sprite, "direction", 180);
  }
}

function moving_north(this_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "speed"), "North");
}

function jittering(this_sprite) {
  changePropBy(this_sprite, "scale", math_random_int(-1, 1));
}

function moving_west(this_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "speed"), "West");
}

function moving_with_arrow_keys(this_sprite) {
  if (isKeyPressed("up")) {
    moveInDirection(this_sprite, getProp(this_sprite, "speed"), "North");
  }
  if (isKeyPressed("down")) {
    moveInDirection(this_sprite, getProp(this_sprite, "speed"), "South");
  }
  if (isKeyPressed("left")) {
    moveInDirection(this_sprite, getProp(this_sprite, "speed"), "West");
  }
  if (isKeyPressed("right")) {
    moveInDirection(this_sprite, getProp(this_sprite, "speed"), "East");
  }
}

function driving_with_arrow_keys(this_sprite) {
  if (isKeyPressed("up")) {
    moveForward(this_sprite, getProp(this_sprite, "speed"));
  }
  if (isKeyPressed("down")) {
    moveBackward(this_sprite, getProp(this_sprite, "speed"));
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

function wobbling(this_sprite) {
  withPercentChance(50, function () {
    setProp(this_sprite, "rotation", math_random_int(-1, 1));
  });
}

function moving_west_and_looping(this_sprite) {
  mirrorSprite(this_sprite, "left");
  moveInDirection(this_sprite, getProp(this_sprite, "speed"), "West");
  if (getProp(this_sprite, "x") < -50) {
    setProp(this_sprite, "x", 450);
  }
}

function moving_east_and_looping(this_sprite) {
  mirrorSprite(this_sprite, "right");
  moveInDirection(this_sprite, getProp(this_sprite, "speed"), "East");
  if (getProp(this_sprite, "x") > 450) {
    setProp(this_sprite, "x", -50);
  }
}

setBackgroundImageAs("grid_1");
makeNewSpriteAnon("cuteanimals_bunny2_1", ({"x":200,"y":200}));
setProp(({costume: "cuteanimals_bunny2_1"}), "scale", 150);
makeNewSpriteAnon("face_carrot_1", ({"x":75,"y":353}));
setProp(({costume: "face_carrot_1"}), "scale", 80);
addBehaviorSimple(({costume: "face_carrot_1"}), draggable());
makeNewSpriteAnon("cuteanimals_penguin_1", ({"x":176,"y":360}));
setProp(({costume: "cuteanimals_penguin_1"}), "scale", 70);
addBehaviorSimple(({costume: "cuteanimals_penguin_1"}), draggable());

checkTouching("when", ({costume: "face_carrot_1"}), ({costume: "cuteanimals_bunny2_1"}), function (extraArgs) {
  changePropBy(({costume: "cuteanimals_bunny2_1"}), "scale", 222);
  playSound('sound://category_collect/clicky_crunch.mp3');
});

checkTouching("when", ({costume: "cuteanimals_penguin_1"}), ({costume: "cuteanimals_bunny2_1"}), function (extraArgs) {
  changePropBy(({costume: "cuteanimals_penguin_1"}), "rotation", 10);
  playSound('sound://category_alerts/vibrant_game_shutter_alert_1_short_quick.mp3');
});
