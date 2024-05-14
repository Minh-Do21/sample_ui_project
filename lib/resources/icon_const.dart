enum ICON_CONST {
  icNotice,
  icMenu,
  icArrowOpen,
  icArrowClose,
  kriso,

  icClose,
  iconNext,
  iconPlayAudio,
  icCheckAccept,
  icLineVertical,
  icSearch,
  icOpenBold,
  icMale,
  icFemale,
  icSuccess,
  icFailure,
}

// ignore: camel_case_extensions
extension ICON_CONST_VALUE on ICON_CONST {
  String get path {
    switch (this) {
      case ICON_CONST.icNotice:
        return 'assets/icons/ic_notice.svg';
      case ICON_CONST.icMenu:
        return 'assets/icons/ic_menu.svg';
      case ICON_CONST.icArrowOpen:
        return 'assets/icons/ic_arrow_open.svg';
      case ICON_CONST.icArrowClose:
        return 'assets/icons/ic_arrow_close.svg';
      case ICON_CONST.kriso:
        return 'assets/icons/kriso.svg';

      case ICON_CONST.icClose:
        return 'assets/icons/ic_close.svg';
      case ICON_CONST.iconNext:
        return 'assets/icons/icon_next.svg';
      case ICON_CONST.iconPlayAudio:
        return 'assets/icons/icon_play_audio.svg';
      case ICON_CONST.icCheckAccept:
        return 'assets/icons/ic_check_accept.svg';
      case ICON_CONST.icLineVertical:
        return 'assets/icons/ic_line_vertical.svg';
      case ICON_CONST.icSearch:
        return 'assets/icons/ic_search.svg';
      case ICON_CONST.icOpenBold:
        return 'assets/icons/ic_open_bold.svg';
      case ICON_CONST.icMale:
        return 'assets/icons/ic_male.svg';
      case ICON_CONST.icFemale:
        return 'assets/icons/ic_female.svg';
      case ICON_CONST.icSuccess:
        return 'assets/icons/ic_success.svg';
      case ICON_CONST.icFailure:
        return 'assets/icons/ic_failure.svg';

      default:
        return '';
    }
  }
}
