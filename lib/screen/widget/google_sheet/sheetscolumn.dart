// ignore_for_file: prefer_const_declarations, non_constant_identifier_names

class SheetsColumn {
  static final String f_name = "FIRST NAME";
  static final String l_name = "LAST NAME";
  static final String eng_name = "ENGLISH NAME";
  static final String phones = "PHONE NUMBER";
  static final String days = "GENDER";
  static final String months = "NATION";
  static final String years = "YEARS";
  static final String finishs = "FINISH";
  static final String datab = "DATE OF BORN";
  static final String village = "VILLAGE";
  static final String address = "ADDRESS";

  static List<String> getColumns() => [
        f_name,
        l_name,
        eng_name,
        phones,
        days,
        months,
        years,
        finishs,
        datab,
        village,
        address
      ];
}
