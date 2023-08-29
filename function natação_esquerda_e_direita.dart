function swimming_left_and_right(este_personagem) {
  if (getProp(este_personagem, "direction") == 0) {
    mirrorSprite(este_personagem, "right");
  } else if (getProp(este_personagem, "direction") == 180) {
    mirrorSprite(este_personagem, "left");
  }
  moveForward(este_personagem, 5);
  if (isTouchingEdges(este_personagem)) {
    edgesDisplace(este_personagem);
    changePropBy(este_personagem, "direction", 180);
  }
}

function shrinking(este_personagem) {
  changePropBy(este_personagem, "scale", -1);
}

function patrolling(este_personagem) {
  moveForward(este_personagem, 5);
  if (isTouchingEdges(este_personagem)) {
    edgesDisplace(este_personagem);
    changePropBy(este_personagem, "direction", 180);
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

function wandering(este_personagem) {
  if (math_random_int(0, 5) == 0) {
    changePropBy(este_personagem, "direction", math_random_int(-25, 25));
  }
  moveForward(este_personagem, 1);
  if (isTouchingEdges(este_personagem)) {
    edgesDisplace(este_personagem);
    changePropBy(este_personagem, "direction", math_random_int(135, 225));
  }
}

function growing(este_personagem) {
  changePropBy(este_personagem, "scale", 1);
}

function jittering(este_personagem) {
  changePropBy(este_personagem, "scale", math_random_int(-1, 1));
}

function moving_east(este_personagem) {
  moveInDirection(este_personagem, 5, "East");
}

function moving_north(este_personagem) {
  moveInDirection(este_personagem, 5, "North");
}

function moving_south(este_personagem) {
  moveInDirection(este_personagem, 5, "South");
}

function moving_west(este_personagem) {
  moveInDirection(este_personagem, 5, "West");
}

function spinning_right(este_personagem) {
  turn(este_personagem, 6, "right");
}

setBackground('#3333ff');
makeNewSpriteAnon("fish_02_1", ({"x":192,"y":126}));
addBehaviorSimple(({costume: "fish_02_1"}), new Behavior(swimming_left_and_right, []));
setProp(({costume: "fish_02_1"}), "speed", 1);
makeNewSpriteAnon("underseadeco_24_1", ({"x":354,"y":345}));
setProp(({costume: "underseadeco_24_1"}), "scale", 200);
addBehaviorSimple(({costume: "underseadeco_24_1"}), new Behavior(jittering, []));
makeNewSpriteAnon("fish_04_1", randomLocation());
setProp(({costume: "fish_04_1"}), "scale", 80);
setProp(({costume: "fish_04_1"}), "rotation", 2);
addBehaviorSimple(({costume: "fish_04_1"}), new Behavior(wandering, []));
makeNewSpriteAnon("hermitcrab_1", ({"x":25,"y":373}));
setProp(({costume: "hermitcrab_1"}), "scale", 40);
addBehaviorSimple(({costume: "hermitcrab_1"}), new Behavior(swimming_left_and_right, []));
