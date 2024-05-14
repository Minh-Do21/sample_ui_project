import 'package:easy_localization/easy_localization.dart';

enum ConfirmStatusEvent {
  confirmStatus,
  unconfirmStatus;

  String get status {
    switch (this) {
      case ConfirmStatusEvent.confirmStatus:
        return 'msg_confirm_status'.tr();
      default:
        return 'msg_unconfirm_status'.tr();
    }
  }

  bool get isConfirmed {
    switch (this) {
      case ConfirmStatusEvent.confirmStatus:
        return true;
      default:
        return false;
    }
  }
}

class ConfirmStatusEventHelper {
  static ConfirmStatusEvent convertType(bool status) {
    if (status) {
      return ConfirmStatusEvent.confirmStatus;
    }

    return ConfirmStatusEvent.unconfirmStatus;
  }
}
