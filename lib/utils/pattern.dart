// TODO: Regex pattern to validate
mixin RegexPattern {
  static final RegExp emailRegExp = RegExp(
    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
  );

  static final RegExp phoneRegExp = RegExp(
    r'(^(?:[+0]9)?[0-9]{9,11}$)',
  );

  static final RegExp zipCodeRegExp = RegExp(
    r'(^(?:[+0]9)?[0-9]{5}$)',
  );
  static final RegExp countPackageRegExp = RegExp(
    r'[0-9]',
  );
}

class DateTimePattern {
  static const dateFormatDefault = 'dd-MM-yyyy HH:mm:ss';
  static const dateFormatPromotion = 'dd-MM-yyyy HH:mm';
  static const dayType0 = 'dd-MM-yyyy';
  static const dayType1 = 'dd/MM/yyyy';
  static const dateFormatWithDay = 'EEEE dd/MM/yyyy';
}
