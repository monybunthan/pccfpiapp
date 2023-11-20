// ignore_for_file: avoid_print, prefer_final_fields

import 'package:gsheets/gsheets.dart';

import 'sheetscolumn.dart';

class SheetsFlutter {
  static String _sheetId = "1QDeTmdr1L-8zlMSKAaKygdYWuMGX6QdTBqfQJqT4AaY";
  static const _sheetCredentials = r'''
{
  "type": "service_account",
  "project_id": "pccfpi-f8ce0",
  "private_key_id": "81b1cb885f38f84edb4a7edf2407abbf2497a58a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC2Bl7lO3FGa3At\nQ3jzHhyN+Wg2a+b9je7dHHeRVzxdKNXDt4+8Exty2aItgZHxLkvbHXyPccECCDFO\n3ZA3qtVAROCjK/XmRhlNJYraX0ck8rKpBxPvUZRVgrEtv+oZ/5zNnM4LKqsb8PBJ\nickkJ3HLXmaWVHZn2tTNsHit8g3POk7QxXgiCYKiV4uXBnc/fXoN2uPz2EmM0zEm\nifxpwsERHorlTvmF6Qhxzj0NiGPIBk9ElxBzD6Yd6jIDqzHhSJYV9lLQE6co8a9y\njrtezgpeW3ZR031D2D1RLkmp6QIWllAQ5Pn/FmrQsF2MHwmY4EqWW7QZjLs9OboA\nL5gHQxzDAgMBAAECggEAURX8bvxwZRDWS2ubtR2sVbiNanTd1QTFq/0S7I1iaBOZ\nSlL6tisC1sJJYyEtrLVVeFol01a2xpt0r6+2n327+qHUOgwKwhZnDf1T4hyAel6d\nJPvwrvL187PBDuLHu+Yo6VVZWhMbX1qRCAlXr4HcyN4YMA6XIoOSucBLuh0ydqW/\nNz6Rer5AnASouinNDlyGJVYiWGk5PdbAnIZsId6mQxaX+nP+hk5rcfGvf5xgm9j5\nAW3QUdooNYwprltTyGg1XSy6s1StZpQCNTrpl53qDsIkxYUelflrVKal4OlSHi5k\nTitLWfy6LTRcgsIEtFqmkRYz6QyecZcB4WsMQGZV8QKBgQDsexQTsN6bFaEVBvxp\n+Nc7m7MzjjLtDPTKWrSwainkr+0khUoV5nzbqxiIMEtGNpVqYBuGoRmr4tYFD2ne\n70taDtttDzGrT5HzuF6j7aURRqp+mqf6GtXk6UcNR+EdBnRt5m7mKLMHZClZnU/b\ne6URUdCrFZIq4FgBWjfukfBiswKBgQDFDJ7Iddo7qWkckxzLDqEeVxwT3YF3CsHn\nSXsNOF9ZhWnlg1ykkpcGlKORnHOkZ1Ln+/9kal3jDHlRKQROJY3WhX0VIW/SMfhW\nkrAXR5C4IKfUj1+0Ap1y+qGhCycHLqtmX0UzPYe/JVr1itB3EA/Zgrl5hEdiAT57\nZil9MIklsQKBgQCct9ROWGCuFl9yN/b/o9G/xyezewF056kykXo9j53D2HMoSM0Y\nRm9ohLL1TkwUdAgBPz/+sLT6nJGJOPXIsH0XadExLWiVR15KTl0p9kv2bwZ+cK/x\np+colRBpVMFzItv2GUhVb5N1yoM8yGwr4H08RSQsvVbo41RvUQLQMBdG0QKBgQC0\nzFOUUq4eN9693S16Er46fGrCv2betvwbHwzMoIC8PvFfKRyD1AzGePNr00U3/6XO\nPSWkGQR0IyndEellWoe94VVXYgqbrkXSCV2QvpVGnI/hNHv3Sr70lIpgnT7+FBAo\nKhnwXfCDrd67lNaZqB8i0BMmL/zfK40M5DwFJddwwQKBgQCPX32mHXHSECx4dXUk\nY/doHBRZJnPcsk1LRSaxULMtjmDncHYBJGLKHAyACporcjfaTUDsqZ65h6GavHAb\n9tlYP00gERLhbsnkM62knFnxBdJLHnCff2ZhKM4Km7NNLrRkelsFmzcp2WWDclXi\nD9DqPpGHNl0FmpoLiEM2iqopCg==\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttersheets@pccfpi-f8ce0.iam.gserviceaccount.com",
  "client_id": "115814083504297010075",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttersheets%40pccfpi-f8ce0.iam.gserviceaccount.com"
}
''';
  static Worksheet? _userSheet;
  static final _gsheets = GSheets(_sheetCredentials);

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_sheetId);

      _userSheet = await _getWorkSheet(spreadsheet, title: "Feed");
      final firstRow = SheetsColumn.getColumns();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}
