// ignore_for_file: non_constant_identifier_names

final RegExp LINK_REG_EXP = RegExp(
    r'([Hh][Tt][Tt][Pp]:\/\/|[Hh][Tt][Tt][Pp][Ss]:\/\/|[Ff]tp:\/\/|^|\s)[\w/\-?=%.]+\.[-a-zA-Z0-9@:%_\+.~#?&//=]+');

final RegExp IP_REG_EXP = RegExp(
    r'([Hh]ttp|[Hh]ttps|www):\/\/\d+.\d+.\d+.\d+(:\d+)*(\/[-a-zA-Z0-9@:%_\+.~#?&\/\/=]+)*');

final RegExp EMAIL_REG_EXP = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

final RegExp PASSWORD_REG_EXP = RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])');

final RegExp DATE_TIME_REG_EXP =
    RegExp(r'^(\d{2}/\d{2}/\d{4}|\d{2}/\d{2}/\d{4}|\d{4}/\d{2}/\d{2})$');
