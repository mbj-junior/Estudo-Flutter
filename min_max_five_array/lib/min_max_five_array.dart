String miniMaxSum(List<int> arr) {
  List<int> response = [0, 0];

  arr.sort();

  for (int i = 0; i < arr.length; i++) {
    if (i != 4) {
      response[0] += arr[i];
    }
    if (i != 0) {
      response[1] += arr[i];
    }
  }

  return response.join(" ");
}
