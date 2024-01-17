.PHONY: coverage

coverage:
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html

runner:
	flutter pub run build_runner build --delete-conflicting-outputs

startweb: 
	flutter run -d chrome