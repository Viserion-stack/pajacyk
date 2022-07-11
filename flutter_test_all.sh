flutter test --reporter expanded --coverage
lcov --remove coverage/lcov.info "lib/**.dart" "lib/**.dart"  -o coverage/lcov_cleaned.info
genhtml -o coverage coverage/lcov.info
open coverage/index.html 