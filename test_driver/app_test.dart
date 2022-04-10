// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy path', () {
    /*
      Given I am on the Choose Conversion Screen
      When I tap "USD to BTC"
      And I enter "10000"
      And I tap "Continue"
      Then I should see "10000 USD is equal to 0.21744850275833424 BTC"
    */
    test("should give conversion of USD to BTC", () async {
      final chooseConversionTextFinder =
          find.byValueKey('choose-conversion-text');
      final usdToBtcButtonFinder = find.byValueKey('usd-to-btc-button');

      // Given I am on the Choose Conversion Screen
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");

      // Tap "USD to BTC"
      driver.tap(usdToBtcButtonFinder);

      // Find input screen text for "USD to BTC"
      final inputTextFinder = find.text('Enter USD to convert to BTC');

      // Expect to be in the correct input screen
      expect(
          await driver.getText(inputTextFinder), 'Enter USD to convert to BTC');

      // Enter 10000
      final inputTextfieldFinder = find.byValueKey('input-text-field');
      driver.tap(inputTextfieldFinder);
      driver.enterText('10000');

      // Find continue button and tap
      final continueButtonFinder = find.byValueKey('continue-button');
      driver.tap(continueButtonFinder);

      // I should see the correct calculation
      final resultTextFinder =
          find.text('10000 USD is equal to 0.21744850275833424 BTC');
      expect(await driver.getText(resultTextFinder),
          '10000 USD is equal to 0.21744850275833424 BTC');

      // Find and tap the done button and expect to be
      // in the choose conversion screen
      final doneButtonFinder = find.byValueKey('done-button');
      driver.tap(doneButtonFinder);
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");
    });

    /*
      Given I am on the Choose Conversion Screen
      When I tap "BTC to USD"
      And I enter "1.5"
      And I tap "Continue"
      Then I should see "1.5 BTC is equal to 30658.600000000002 USD"
    */
    test("should give conversion of BTC to USD", () async {
      final chooseConversionTextFinder =
          find.byValueKey('choose-conversion-text');
      final btcToUsdButtonFinder = find.byValueKey('btc-to-usd-button');

      // Given I am on the Choose Conversion Screen
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");

      // Tap "BTC to USD"
      driver.tap(btcToUsdButtonFinder);

      // Find input screen text for "BTC to USD"
      final inputTextFinder = find.text('Enter BTC to convert to USD');

      // Expect to be in the correct input screen
      expect(
          await driver.getText(inputTextFinder), 'Enter BTC to convert to USD');

      // Enter 1.5
      final inputTextfieldFinder = find.byValueKey('input-text-field');
      driver.tap(inputTextfieldFinder);
      driver.enterText('1.5');

      // Find continue button and tap
      final continueButtonFinder = find.byValueKey('continue-button');
      driver.tap(continueButtonFinder);

      // I should see the correct calculation
      final resultTextFinder = find.text('1.5 BTC is equal to 68981.85 USD');
      expect(await driver.getText(resultTextFinder),
          '1.5 BTC is equal to 68981.85 USD');

      // Find and tap the done button and expect to be
      // in the choose conversion screen
      final doneButtonFinder = find.byValueKey('done-button');
      driver.tap(doneButtonFinder);
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");
    });
  });

  group("Sad Path", () {
    /*
      Given I am on the Choose Conversion Screen
      When I tap "USD to BTC"
      And I enter "" (Empty)
      And I tap "Continue"
      Then I should see "Invalid Input"
    */
    test("should get error on an empty input", () async {
      final chooseConversionTextFinder =
          find.byValueKey('choose-conversion-text');
      final usdToBtcButtonFinder = find.byValueKey('usd-to-btc-button');

      // Given I am on the Choose Conversion Screen
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");

      // Tap "USD to BTC"
      driver.tap(usdToBtcButtonFinder);

      // Find input screen text for "USD to BTC"
      final inputTextFinder = find.text('Enter USD to convert to BTC');

      // Expect to be in the correct input screen
      expect(
          await driver.getText(inputTextFinder), 'Enter USD to convert to BTC');

      // Find continue button and tap
      final continueButtonFinder = find.byValueKey('continue-button');
      driver.tap(continueButtonFinder);

      // Find the invalid input error
      final invalidTextFinder = find.text('Invalid Input');
      expect(await driver.getText(invalidTextFinder), 'Invalid Input');

      // Return to Choose Conversion Screen
      final backButttonFinder = find.byValueKey('back-button1');
      driver.tap(backButttonFinder);
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");
    });

    /*
      Given I am on the Choose Conversion Screen
      When I tap "USD to BTC"
      And I enter " " (space)
      And I tap "Continue"
      Then I should see "Invalid Input"
    */
    test("should get error on an input with a space character", () async {
      final chooseConversionTextFinder =
          find.byValueKey('choose-conversion-text');
      final usdToBtcButtonFinder = find.byValueKey('usd-to-btc-button');

      // Given I am on the Choose Conversion Screen
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");

      // Tap "USD to BTC"
      driver.tap(usdToBtcButtonFinder);

      // Find input screen text for "USD to BTC"
      final inputTextFinder = find.text('Enter USD to convert to BTC');

      // Expect to be in the correct input screen
      expect(
          await driver.getText(inputTextFinder), 'Enter USD to convert to BTC');

      // Enter 10000
      final inputTextfieldFinder = find.byValueKey('input-text-field');
      driver.tap(inputTextfieldFinder);
      driver.enterText(' ');

      // Find continue button and tap
      final continueButtonFinder = find.byValueKey('continue-button');
      driver.tap(continueButtonFinder);

      // Find invalid input text and expect to remain in the same screen
      final invalidTextFinder = find.text('Invalid Input');
      expect(await driver.getText(invalidTextFinder), 'Invalid Input');

      // Return to Choose Conversion Screen
      final backButttonFinder = find.byValueKey('back-button1');
      driver.tap(backButttonFinder);
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");
    });
    /*
      Given I am on the Choose Conversion Screen
      When I tap "USD to BTC"
      And I enter "h%," 
      And I tap "Continue"
      Then I should see "Invalid Input"
    */
    test("should get error on an input with non-numerical values", () async {
      final chooseConversionTextFinder =
          find.byValueKey('choose-conversion-text');
      final usdToBtcButtonFinder = find.byValueKey('usd-to-btc-button');

      // Given I am on the Choose Conversion Screen
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");

      // Tap "USD to BTC"
      driver.tap(usdToBtcButtonFinder);

      // Find input screen text for "USD to BTC"
      final inputTextFinder = find.text('Enter USD to convert to BTC');

      // Expect to be in the correct input screen
      expect(
          await driver.getText(inputTextFinder), 'Enter USD to convert to BTC');

      // Enter "h%,"
      final inputTextfieldFinder = find.byValueKey('input-text-field');
      driver.tap(inputTextfieldFinder);
      driver.enterText('h&,');

      // Find continue button and tap
      final continueButtonFinder = find.byValueKey('continue-button');
      driver.tap(continueButtonFinder);

      //Find the invalid input error
      final invalidTextFinder = find.text('Invalid Input');
      expect(await driver.getText(invalidTextFinder), 'Invalid Input');

      // Return to Choose Conversion Screen
      final backButttonFinder = find.byValueKey('back-button1');
      driver.tap(backButttonFinder);
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");
    });

    /*
      Given I am on the Choose Conversion Screen
      When I tap "USD to BTC"
      And I enter "1.2.3" 
      And I tap "Continue"
      Then I should see "Invalid input"
    */
    test("should get error on an input with two decimal points", () async {
      final chooseConversionTextFinder =
          find.byValueKey('choose-conversion-text');
      final usdToBtcButtonFinder = find.byValueKey('usd-to-btc-button');

      // Given I am on the Choose Conversion Screen
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");

      // Tap "USD to BTC"
      driver.tap(usdToBtcButtonFinder);

      // Find input screen text for "USD to BTC"
      final inputTextFinder = find.text('Enter USD to convert to BTC');

      // Expect to be in the correct input screen
      expect(
          await driver.getText(inputTextFinder), 'Enter USD to convert to BTC');

      // Enter "1.2.3"
      final inputTextfieldFinder = find.byValueKey('input-text-field');
      driver.tap(inputTextfieldFinder);
      driver.enterText('1.2.3');

      // Find continue button and tap
      final continueButtonFinder = find.byValueKey('continue-button');
      driver.tap(continueButtonFinder);

      //Find the invalid input error
      final invalidTextFinder = find.text('Invalid Input');
      expect(await driver.getText(invalidTextFinder), 'Invalid Input');

      // Return to Choose Conversion Screen
      final backButttonFinder = find.byValueKey('back-button1');
      driver.tap(backButttonFinder);
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");
    });

    /*
      Given I am on the Choose Conversion Screen
      When I tap "USD to BTC"
      And I enter "-10" 
      And I tap "Continue"
      Then I should see "Invalid input"
    */
    test("should get error on an input with a negative number", () async {
      final chooseConversionTextFinder =
          find.byValueKey('choose-conversion-text');
      final usdToBtcButtonFinder = find.byValueKey('usd-to-btc-button');

      // Given I am on the Choose Conversion Screen
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");

      // Tap "USD to BTC"
      driver.tap(usdToBtcButtonFinder);

      // Find input screen text for "USD to BTC"
      final inputTextFinder = find.text('Enter USD to convert to BTC');

      // Expect to be in the correct input screen
      expect(
          await driver.getText(inputTextFinder), 'Enter USD to convert to BTC');

      // Enter "-10"
      final inputTextfieldFinder = find.byValueKey('input-text-field');
      driver.tap(inputTextfieldFinder);
      driver.enterText('-10');

      // Find continue button and tap
      final continueButtonFinder = find.byValueKey('continue-button');
      driver.tap(continueButtonFinder);

      //Find the invalid input error
      final invalidTextFinder = find.text('Invalid Input');
      expect(await driver.getText(invalidTextFinder), 'Invalid Input');

      // Return to Choose Conversion Screen
      final backButttonFinder = find.byValueKey('back-button1');
      driver.tap(backButttonFinder);
      expect(await driver.getText(chooseConversionTextFinder),
          "Choose Conversion");
    });
  });
}
