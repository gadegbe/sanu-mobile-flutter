extension XObject on Object? {
  bool get isNull => this == null;

  bool get isNotNull => !isNull;
}
