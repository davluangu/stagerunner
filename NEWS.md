# Version 0.5.0

* Refactored the `stageRunner`, `stageRunnerNode`, and `treeSkeleton`
  reference classes to use [R6 classes](http://github.com/wch/R6), in
  preparation for public release of the package.

# Version 0.4.1

* Added an `is_pre_stagerunner` helper function that returns TRUE or FALSE
  according as an object can be transformed into a stageRunner.

# Version 0.4.0

* Integration with the [objectdiff package](http://github.com/robertzk/objectdiff).
  This means passing a `tracked_environment` object as the `context` to
  a `stageRunner` will result in much smarter memory management of environment
  changes as you run its stages (objectdiff uses clever patching functions to
  record only *changes* to an environment as it is being modified; without this
  logic, a stageRunner has to copy an environment in full on each executed
  stage, which is especially expensive if you are manipulating large data sets).

# Version 0.3.2

* Stagerunners now contain an `$around` method that allows for
  wrapping terminal stages with some behavior, akin to the
  `yield` keyword in Ruby blocks. This can be
  useful for interim debugging, visualization, etc. For more
  information see `?stageRunner__around`.

