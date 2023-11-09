final List<String> calculatorValue = [
  "A/C",
  "+/-",
  "%",
  "÷",
  "7",
  "8",
  "9",
  "×",
  "4",
  "5",
  "6",
  "-",
  "1",
  "2",
  "3",
  "+",
  "C",
  "0",
  ".",
  "="
];

String textValue = "";
String calculatorResult = "";
int maxLength = 15;
bool lastCharacterIsSign = false;
bool lastCharacterIsDecimalPoint = false;

void updateText(String newText) {
  if (newText != "A/C" &&
      newText != "+/-" &&
      newText != "%" &&
      newText != "C" &&
      newText != "=" &&
      textValue.length < maxLength) {
    if (newText == "." &&
        lastCharacterIsDecimalPoint &&
        textValue.contains(".")) {
      return; // Prevent consecutive decimal points.
    } else if (isSign(newText) && lastCharacterIsSign) {
      return; // Prevent consecutive signs.
    }
    lastCharacterIsSign = isSign(newText);
    lastCharacterIsDecimalPoint = newText == ".";
    textValue += newText;
  } else if (newText == "A/C") {
    clearInput();
  } else if (newText == "C") {
    removeLastCharacter();
  } else if (newText == "+/-" && textValue.isNotEmpty) {
    toggleSign();
  } else if (newText == "%" && textValue.isNotEmpty) {
    handlePercentage();
  } else if (newText == "=") {
    getResult();
  }
}

bool isSign(String text) {
  return text == "+" || text == "-" || text == "×" || text == "÷";
}

void clearInput() {
  textValue = "";
  calculatorResult = "";
  lastCharacterIsSign = false;
  lastCharacterIsDecimalPoint = false;
}

void removeLastCharacter() {
  if (textValue.isNotEmpty) {
    textValue = textValue.substring(0, textValue.length - 1);
    lastCharacterIsSign = isSign(
        textValue.isNotEmpty ? textValue.substring(textValue.length - 1) : "");
    lastCharacterIsDecimalPoint = textValue.endsWith(".");
  }
}

void toggleSign() {
  if (textValue.startsWith("-")) {
    textValue = textValue.substring(1);
  } else {
    textValue = "-$textValue";
  }
}

void handlePercentage() {
  double number = double.parse(textValue);
  calculatorResult = (number / 100).toString();
}

String getResult() {
  if (textValue.isEmpty) {
    calculatorResult = "0";
  } else {
    List<String> numbers = textValue.split(RegExp("[+×÷-]"));
    List<String> operators = textValue.split(RegExp("[0-9.]"));
    operators.removeWhere((element) => element.isEmpty);
    double result = double.parse(numbers[0]);

    for (int i = 0; i < operators.length; i++) {
      double nextNumber = double.parse(numbers[i + 1]);
      if (operators[i] == '+') {
        result += nextNumber;
      } else if (operators[i] == '×') {
        result *= nextNumber;
      } else if (operators[i] == '÷') {
        if (nextNumber != 0) {
          result /= nextNumber;
        } else {
          calculatorResult = "Error";
          return calculatorResult;
        }
      } else if (operators[i] == '-') {
        result -= nextNumber;
      }
    }

    calculatorResult = result.toString();
  }

  return calculatorResult;
}
