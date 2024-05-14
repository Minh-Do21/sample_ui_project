enum ActionTypeGetPoint {
  getCodePoint,
}

extension ActionTypeGetPointExtension on ActionTypeGetPoint {
  String get type {
    switch (this) {
      case ActionTypeGetPoint.getCodePoint:
        return 'GET_CODE_POINT';
      default:
        return '';
    }
  }
}

class ActionTypeHelper {
  static ActionTypeGetPoint convertType(String type) {
    if (type == 'GET_CODE_POINT') {
      return ActionTypeGetPoint.getCodePoint;
    }
    return ActionTypeGetPoint.getCodePoint;
  }
}
