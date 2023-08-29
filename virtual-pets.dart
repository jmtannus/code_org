função patrulhamento(this_sprite) {
  moveForward(this_sprite, getProp(this_sprite, "velocidade"));
  if (isTouchingEdges(this_sprite)) {
    bordasDisplace(this_sprite);
    changePropBy(this_sprite, "direção", 180);
  }
  if (getProp(this_sprite, "direção") > 270 || getProp(this_sprite, "direção") < 90) {
    mirrorSprite(este_sprite, "certo");
  } outro {
    mirrorSprite(este_sprite, "esquerda");
  }

}

função math_random_int (a, b) {
  se (a > b) {
    // Troque aeb para garantir que a seja menor.
    varc = uma;
    uma =b;
    b=c;
  }
  retornar Math.floor(Math.random() * (b - a + 1) + a);
}

função vagando(este_sprite) {
  withPercentChance(20, function() {
    changePropBy(this_sprite, "direção", math_random_int(-25, 25));
  });
  moveForward(this_sprite, getProp(this_sprite, "velocidade"));
  if (isTouchingEdges(this_sprite)) {
    bordasDisplace(this_sprite);
    changePropBy(this_sprite, "direção", math_random_int(135, 225));
  }
  if (getProp(this_sprite, "direção") > 270 || getProp(this_sprite, "direção") < 90) {
    mirrorSprite(este_sprite, "certo");
  } outro {
    mirrorSprite(este_sprite, "esquerda");
  }

}

função movendo_east(este_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Leste");
}

função girando_esquerda (este_sprite) {
  turn(this_sprite, 6, "esquerda");
}

função girando_direita(este_sprite) {
  turn(este_sprite, 6, "direita");
}

função diminuindo(este_sprite) {
  changePropBy(this_sprite, "escala", -1);
}

função crescendo(este_sprite) {
  changePropBy(this_sprite, "escala", 1);
}

função movendo_sul(este_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Sul");
}

função natação_esquerda_e_direita (este_sprite) {
  if (getProp(este_sprite, "direção") == 0) {
    mirrorSprite(este_sprite, "certo");
  } else if (getProp(this_sprite, "direção") == 180) {
    mirrorSprite(este_sprite, "esquerda");
  }
  moveForward(this_sprite, getProp(this_sprite, "velocidade"));
  if (isTouchingEdges(this_sprite)) {
    bordasDisplace(this_sprite);
    changePropBy(this_sprite, "direção", 180);
  }
}

função movendo_norte(este_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Norte");
}

função tremulante(this_sprite) {
  changePropBy(this_sprite, "escala", math_random_int(-1, 1));
}

função movendo_oeste(este_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Oeste");
}

função movendo_com_arrow_keys(este_sprite) {
  if (isKeyPressed("para cima")) {
    moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Norte");
  }
  if (isKeyPressed("para baixo")) {
    moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Sul");
  }
  if (isKeyPressed("esquerda")) {
    moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Oeste");
  }
  if (isKeyPressed("direita")) {
    moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Leste");
  }
}

função dirigindo_com_arrow_keys(this_sprite) {
  if (isKeyPressed("para cima")) {
    moveForward(this_sprite, getProp(this_sprite, "velocidade"));
  }
  if (isKeyPressed("para baixo")) {
    moveBackward(this_sprite, getProp(this_sprite, "velocidade"));
  }
  if (isKeyPressed("esquerda")) {
    changePropBy(este_sprite, "direção", -5);
    changePropBy(this_sprite, "rotação", -5);
  }
  if (isKeyPressed("direita")) {
    changePropBy(this_sprite, "direção", 5);
    changePropBy(this_sprite, "rotação", 5);
  }
  if (isTouchingEdges(this_sprite)) {
    bordasDisplace(this_sprite);
  }
}

função vibrando(this_sprite) {
  changePropBy(this_sprite, "y", math_random_int(-1, 1));
}

função oscilante(this_sprite) {
  withPercentChance(50, function() {
    setProp(this_sprite, "rotação", math_random_int(-1, 1));
  });
}

função moving_west_and_looping(this_sprite) {
  mirrorSprite(este_sprite, "esquerda");
  moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Oeste");
  if (getProp(este_sprite, "x") < -50) {
    setProp(este_sprite, "x", 450);
  }
}

função moving_east_and_looping(this_sprite) {
  mirrorSprite(este_sprite, "certo");
  moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Leste");
  if (getProp(este_sprite, "x") > 450) {
    setProp(este_sprite, "x", -50);
  }
}

função moving_north_and_looping(este_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Norte");
  if (getProp(este_sprite, "y") > 450) {
    setProp(este_sprite, "y", -50);
  }
}

função moving_south_and_looping(this_sprite) {
  moveInDirection(this_sprite, getProp(this_sprite, "velocidade"), "Sul");
  if (getProp(este_sprite, "y") < -50) {
    setProp(este_sprite, "y", 450);
  }
}

setBackgroundImageAs("textura_05_1");
makeNewSpriteAnon("cuteanimals_dog_1", ({"x":188,"y":131}));
makeNewSpriteAnon("bowl_1", ({"x":52,"y":331}));
makeNewSpriteAnon("tennisball_1", ({"x":332,"y":332}));
setProp(({fantasia: "cuteanimals_dog_1"}), "escala", 100);
setProp(({fantasia: "tigela_1"}), "escala", 100);
setProp(({fantasia: "tenisball_1"}), "escala", 50);
addBehaviorSimple(({costume: "bowl_1"}), arrastável());
addBehaviorSimple(({fantasia: "tennisball_1"}), arrastável());

checkTouching("quando", ({costume: "cuteanimals_dog_1"}), ({costume: "bowl_1"}), function (extraArgs) {
  changePropBy(({fantasia: "cuteanimals_dog_1"}), "escala", 10);
  playSound('sound://category_collect/clicky_crunch.mp3');
});

checkTouching("quando", ({costume: "cuteanimals_dog_1"}), ({costume: "tennisball_1"}), function (extraArgs) {
  removeAllBehaviors(({fantasia: "cuteanimals_dog_1"}));
  addBehaviorSimple(({costume: "cuteanimals_dog_1"}), new Behavior(spinning_right, []));
  playSound('sound://category_hits/vibrant_game_bounce_and_ding_notification.mp3');
});

spriteClicked("quando", ({fantasia: "cuteanimals_dog_1"}), função (extraArgs) {
  removeAllBehaviors(({fantasia: "cuteanimals_dog_1"}));
  pointInDirection(({fantasia: "cuteanimals_dog_1"}), "Norte");
  playSound('sound://category_animals/puppy.mp3');
});
