String convertToKhmerNumerals(String input) {
  const khmerNumerals = {
    '0': '០',
    '1': '១',
    '2': '២',
    '3': '៣',
    '4': '៤',
    '5': '៥',
    '6': '៦',
    '7': '៧',
    '8': '៨',
    '9': '៩',
  };
  return input.split('').map((char) => khmerNumerals[char] ?? char).join();
}
