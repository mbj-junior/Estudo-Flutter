class Tree {
  int x;
  Tree l;
  Tree r;

  Tree(this.x, this.l, this.r);
}

int longestDistinctPath(Tree root, Set<int> seenValues) {
  if (root == null) {
    return 0;
  }

  if (seenValues.contains(root.x)) {
    return 0;
  }

  seenValues.add(root.x);

  int leftPath = longestDistinctPath(root.l, seenValues);
  int rightPath = longestDistinctPath(root.r, seenValues);

  seenValues.remove(root.x);

  return 1 + (leftPath > rightPath ? leftPath : rightPath);
}

int solution(Tree T) {
  Set<int> seenValues = Set<int>();
  return longestDistinctPath(T, seenValues);
}

void main() {
  Tree tree = Tree(
    1,
    Tree(
      2,
      Tree(
        3,
        Tree(2, null, null),
        null,
      ),
      Tree(6, null, null),
    ),
    Tree(
      3,
      Tree(3, null, null),
      Tree(
        1,
        Tree(5, null, null),
        Tree(6, null, null),
      ),
    ),
  );

  int result = solution(tree);

  print('The number of nodes on the longest distinct path is: $result');
}
