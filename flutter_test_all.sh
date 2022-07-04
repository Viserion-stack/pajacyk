flutter test --reporter expanded --coverage
genhtml -o coverage coverage/lcov.info
open coverage/index.html 