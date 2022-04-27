import 'package:gsheets/gsheets.dart';
import 'package:food_recipes/models/meal_model.dart';

class MealsSheetApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutter-recipe-webapp",
  "private_key_id": "7af2009abb14393d1ad6e68e66d6d5f6a291fe58",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCn2B6lc/VhVcPn\n1Vn5jgBcB2+NsDCueClmOowJ/uZvCqQqk192/6WnRkkClC4kp0e1DLKI5ePm+WV5\n8qBghJcHlXXLBNO0U5FDcGIvpvd8ZPAJBxBr6iEPB5or07xTK0ltB64CJkZ4QvBi\naM4YIeTq7Ja5nz+99kLmNgkeD57ZKdQOEd1XTd6PyW/ycR8vfMHCX8GX/T/TQQct\nCXGjdauycA2PXjbHqasoDaYwPck+HLX0fbN83UkQHkmZ7cNJq2s+UVeQxDrM1FOy\njAfBQxirPrxTwfF5yIWdxvfA4vAK4K0l60V4927j76a6K9bOovEao3d9D9hYLQ90\nZAJ6rYWxAgMBAAECggEAASPkgRImojau0LlSxdwZ+BtpUwyLEh5ZGqY5FhF2xN2X\nw/3HDd6v+YZOf+oxiOMgMgnKwIe+RU8KVPp0g4oBttCZkaDgDsyBXb8f/aFMMwVC\nWloDeauIILXiorEAKXj6GVe5DgTu9jQZ4F3u+3vnIL+YHl1HdbMG8pEpUpx/eIvE\n6IbW4eHSN8C4+9cIfYg4v+4qaAaaULOgIbwdJy9dNS09sz98U9Uv9SN4Mv8Wiz9I\nq8hnRFdpoj331ZTGjRPM85brX27lH6EV+oiT33pgPRAPYmxjURiJQve87aAh1ZxX\nZsP6fY/tD/Gor19AMxj4arW35KR2uNLJ2W/VgMQAwQKBgQDlaYbGP8g3kVNm4I/L\ntlbdIJTug6tFo/g6LUW5rmRKyr/84m56RqRdNCI7P/iNq6jd5aRiy5b+7GTyUibh\ncUE/yrBlRCavvwkUWpt2w2h9iYbTi9FA1C2PpF/M7RC4zPtTFqSgVLaj7PXpPX3T\nsTpfXwc1cE00+VQ/wQfPoyYcEQKBgQC7S+vEtsFS/+7RzwyfEt2db0/RaXbw+idg\nzzn4z0Zjowb8lJVR/dyTRRwr3+KYUMjZVl8AMZ1SghAr9V4Coju4j3ifGmlUB825\nm86Aty0RSLIFlsmqsMJDbkxeiYObIVTryZ/1yZ3x7La5nKE5kI17RpDRf95vvejW\nFn39vWLvoQKBgQCf8BQP/sOdSen1XTWi9jpU67QpHQ64/HnARXPI4fX11qhGq64N\n/VX1zLTYzd6BFl4iZUlXv0xD6ZbvAastnQG6cZrM3tiByhOQZyLfh5g/fTPMJDv8\nkHA7JoPLoLL5w56r7KtVQ/oZCsjelQo2HebuOpgR/3s0JWdBE1hYwAt/oQKBgGhx\no94kk5X3RnQVY9JpMNAUPIxopX0n4kGoDYnj/DqftMuxB7ubNx+g0F7fEHsjwX0B\nHyT6heJ2yRHaWDxbv7Xhu7/teIL1fxFcA0Hf4+/Ze/yF45udyhbUMR4ezRb69WIv\nI1Zqwfsgp5zF7Vouc9ckuKk7Bw2E94w7KrMOo1dBAoGBANMHEOHrvwRf3NXC/PFG\nAJzsajYeYfrnb1fTzG0fJPzvSKTZuaWjWu4x2eu9/I4bJ99c3BS8RRJ4aPqnTKge\na7cHLc6OrOQ8aAuY6mjdzEh65FxR7QQkPFEtoH5cdXXmkGSySrA4J0baL5OhAZgI\n4IaG1GYPjShzrbl9gNsUGH/C\n-----END PRIVATE KEY-----\n",
  "client_email": "recipe@flutter-recipe-webapp.iam.gserviceaccount.com",
  "client_id": "109025311096501798803",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/recipe%40flutter-recipe-webapp.iam.gserviceaccount.com"
}
''';
  static final _spreadsheetId = '1p9il1v05WRRJIzP_vx_LKFQvj3fEJf6lkXOlvWUinkc';
  static final _recipe = GSheets(_credentials);
  static Worksheet? _mealSheet;

  static Future init() async {
    final spreadsheet = await _recipe.spreadsheet(_spreadsheetId);
    _mealSheet = await _getWorkSheet(spreadsheet, title: 'Meals');
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
}
