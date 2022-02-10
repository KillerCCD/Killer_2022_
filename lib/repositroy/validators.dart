class Validators {
  static final RegExp _fullNameRegExp = RegExp(
    r"([ա-ֆԱ-Ֆա-ֆԱ-Ֆ\w+а-яА-Яа-яА-Я]\s+)",
  );
  static final RegExp _legalCompanyNameRegExp = RegExp(
    r"([ա-ֆԱ-Ֆա-ֆԱ-Ֆ\s+\w+а-яА-Яа-яА-Я])",
  );
  static final RegExp _taxCodeRegExp = RegExp(
    r"[\d+]",
  );
  static final RegExp _legalAddressRegExp = RegExp(
    r'[\w+\d+/\W\S_]',
  );
//+37498998899
  static final RegExp _phoneRegExp = RegExp(
    r'^[0-9]',
  );

  static final RegExp _emailRegExp = RegExp(
    r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$',
  );
  static final RegExp _emailorPhoneRegExp = RegExp(
    r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}|[0-9\+\-]{6}$',
  );

  static final RegExp _passwordRegExp = RegExp(
    r'[A-Z,a-z,0-9(а-яА-Я)ա-ֆԱ-Ֆ]{6}',
  );

  static final RegExp _bdgRegExp = RegExp(
    r'[a-zA-Z0-9]',
  );

  static final RegExp _aptRegExp = RegExp(
    r'^[a-zA-Z0-9]+',
  );
  static final RegExp _floorRegExp = RegExp(
    r'^[0-9]+',
  );
  static final RegExp _entryRegExp = RegExp(
    r'^[0-9]+',
  );
  static final RegExp _comentRegExp = RegExp(
    r'^[a-zA-Z0-9(а-яА-Я)ա-ֆԱ-Ֆ]+',
  );
  static final RegExp _contactPhoneNum = RegExp(
    r'^[0-9\+\-]{6}',
  );

  static isValidLongitude(String longitude) {
    return longitude.length > 3;
  }

  static isValidLatitude(String latitude) {
    return latitude.length > 3;
  }

  static isValidContactPhoneNm(String phoneNm) {
    return _contactPhoneNum.hasMatch(phoneNm);
  }

  static isValidStreetName(String streetname) {
    return streetname.length > 6;
  }

  static isValidBdg(String bdg) {
    return _bdgRegExp.hasMatch(bdg);
  }

  static isValidapt(String apt) {
    return _aptRegExp.hasMatch(apt);
  }

  static isValidfloor(String floor) {
    return _floorRegExp.hasMatch(floor);
  }

  static isValidEntry(String entry) {
    return _entryRegExp.hasMatch(entry);
  }

  static isValidFullName(String fullName) {
    return _fullNameRegExp.hasMatch(fullName);
  }

  static isValidPhone(String phone) {
    return _phoneRegExp.hasMatch(phone);
  }

  static isValidComent(String coment) {
    return _comentRegExp.hasMatch(coment);
  }

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidEmailorPhone(String emailOrPhone) {
    return _emailorPhoneRegExp.hasMatch(emailOrPhone);
  }

  static isValidCompanyEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidLegalName(String legalName) {
    return _legalCompanyNameRegExp.hasMatch(legalName.toString());
  }

  static isValidTaxCode(String taxCode) {
    return _taxCodeRegExp.hasMatch(taxCode);
  }

  static isValidLegalAddress(String legalAddress) {
    return _legalAddressRegExp.hasMatch(legalAddress);
  }

  static isValidSdn(String sdn) {
    return _fullNameRegExp.hasMatch(sdn);
  }
}
