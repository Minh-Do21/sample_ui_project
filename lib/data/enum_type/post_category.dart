enum PostCategory {
  KNOWLEDGE,
  NEWS,
}

extension PostCategoryExtension on PostCategory {
  int get type {
    switch (this) {
      case PostCategory.KNOWLEDGE:
        return 3;
      default:
        return 4;
    }
  }
}
