String miniMaxSum(List<int> numbres) {
  List<int> response = [0, 0];

  for (int i = 0; i < numbres.length; i++) {
    if (i != 4) {
      response[0] += numbres[i];
    }
    if (i != 0) {
      response[1] += numbres[i];
    }
  }

  return response.join(" ");
}
