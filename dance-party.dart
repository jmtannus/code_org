whenSetup(function () {
  setBackgroundEffectWithPalette("diamonds", "cool");
  makeNewDanceSpriteGroup(6, "PINEAPPLE", "row");
  makeAnonymousDanceSprite("DUCK", {x: 200, y: 200});
  setPropEach("PINEAPPLE", "scale", 65);
  setPropEach("DUCK", "scale", 120);
});

atTimestamp(4, "measures", function () {
  changeMoveEachLR("PINEAPPLE", MOVES.Fresh, -1);
  changeMoveEachLR("DUCK", MOVES.Fresh, -1);
});
