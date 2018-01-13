package = "space_intruders"
version = "1.0.0-1"
source = {
   url = "git://github.com/leftiness/space_intruders.git",
   branch = "master"
}
description = {
   summary = "Space Invaders made with LÖVE",
   detailed = "There are many Space Invaders clones. This one is mine.",
   homepage = "https://github.com/leftiness/space_intruders",
   license = "MIT"
}
dependencies = {
   "lua == 5.1",
   "hardoncollider == 0.1-0",
   "middleclass == 4.1-0",
   "tiny-ecs == 1.3-3"
}
build = {
   type = "make",
   makefile = "makefile",
   build_pass = false,
   install_pass = false,
   build_variables = {
     CFLAGS = "$(CFLAGS)"
   }
}
