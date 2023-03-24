import 'dart:convert';
import 'dart:io';

import 'package:googleapis/vision/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:googleapis_auth/auth_io.dart';

class MachineVision {
  final _credentialsFile = File('android/credentials.json');
  late final VisionApi _api;
  final List<String> items = ['Laptop', 'Pizza', 'Cup'];
  int current_index = 0;
  Future<String> getLabels(String? path) async {
    String result = items[current_index % items.length];
    current_index += 1;
    return result;
  }
  //   if (path == null) return 'Error Occured';
  //   final inputImage = InputImage.fromFilePath(path);
  //   final objectDetector = ObjectDetector(
  //       options: ObjectDetectorOptions(
  //           mode: DetectionMode.single,
  //           multipleObjects: false,
  //           classifyObjects: true));
  //   final imageLabels = await objectDetector.processImage(inputImage);
  //   await objectDetector.close();
  //   imageLabels.forEach((element) {
  //     element.labels.forEach((element) {
  //       print(element.text);
  //     });
  //   });

  // return imageLabels.first.labels.first.text;
  // final result = await detectProminentObject(File(path!));
  // return result?.name ?? 'No Name for the object';
  // }

//   authenticate() async {
//     final _credentials = ServiceAccountCredentials.fromJson(r'''{
//   "type": "service_account",
//   "project_id": "lucid-tiger-381422",
//   "private_key_id": "a75d25e24e40680c64d7995b1e85deae0308cff8",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCy/KQEhgVzT9CP\n+7k5Jm0Asj5SEE3mjxJXfNC7DLPk+IECm8+j2Op9IdwUA1sYrX5pwUwmUjvxDRaH\nL+P8nzhcItIaZJzwfKKtkLw3lW1sJEwbwnY3S71rLuPKGd76le7fDJ7hFj3NJ/wm\nuc6dxh3/VBRrrMwpN716TKc8zwsW7VlkR+nZlZNI+J9oQK0RKHziYId3hHl4vMR2\nd+HJudN7zZG6v7+a0hbmp4PLTBzhtYM44jt80v+9KVE/gFk8T29qiNpu0/BIFLLo\n1F3yf2HRFZzOpnNq7bKJ65XpJEdl+yBZxhlC9BolQsxcwBpnKPvMl9e5wmxLGzig\nRwgEtNJBAgMBAAECggEAVJ+5RoA9DHd0kta/jKM7zyP27iLSSgtj7yROpdlMJppN\nmLelNQDmYPJE1Nt/UwwYJBUllUq1F3OKLrF4V+TJp1o5PwxJ3TP4UBqJurf2C7af\nm1JWRS+Up5v8S/3uXEjOLvwPFDnJT3mzsHWSGCtm3GTa4MvKnURC3BNo0InNYvFZ\n7iLBLC8KWCvHASpDNeY7wMSiEsZ1Ihbz0OzRfIJ83deEutOtoqIfmAwQ5KB2vDEY\nGERYhZxVxhaKEriYCxg0in2ZUZsPKvXChYkFvXmEiNq9uqHqFleuaagalLPaY/3h\nqvk64Ks3G0FiOhbEOT4VqjlLhLhanVimBXq+vU/CXwKBgQD0U9rXbw6w8U0rzYhn\nXU9+GZQLZDzPt4TzMLpQCsqv77nkqcGIBkEm+GaCsxFrzttSshnMYHxRZEHxlWun\nIWPHV1DIHUbOZQls/guH/mE44hf6LcSFpS1L7J+yYal8xMlSwte6urdFNEfo83CD\n3WFOC0mf6B8eUzCql+rZR2u3CwKBgQC7iaoJzba2VFS2VzBQo9YjtgdSxDRq7j+8\nwDS6S/tkbwMo7BeGEfnZdgEdgoyQfc762ZJ02mSfvrV2SIwh0keT4I5EBUhFZHJ0\n3PQke7XgtGc0nAkld9fuzi+vSmdlWAVA4cGR97gdMTAMwzaPYREZYGbWKrozIcxD\nd7qLXQi7YwKBgQDSHHa7A4eHxMtPmv3tngHpeEenEDl3i+OqW0It6UnqyOZ87TtA\nJdjLkZxeU23s30QfNogXCPZ/7A8FmTCt1nn/CGiw3vRwM9VKRKJX/ftPtqdV/xvc\nrnJos4GWHoRphrV3FZX9v+oxekdI3mjpDW1Ld0uGV1DDfFkCq4hL+C56hwKBgD9d\nCQ2c6tH59lFRbiqg4JZaR2koj8ldTD2691XGnF7Xv0qRUnVjF3bpDwFofZPIXimV\nX42JyJvMtMUNSAOZZ8PICGllG4EOqjlf+kFlZxNQANreqZx2PIgcNDJWwk6Uidnd\nLSjjeNqsJt75CjMxibR4ROaxsw3ZqolVJ7s0qOGfAoGBAJv0RiFaTml8HwN0X6i3\nK7yMqQcvCy1GE5Iv7iIFqEOLvQOO5XzwehYiUM0C2f8kmGYlm4PAp4eEowd42wel\nA1X6eeuEr+Ad8D6RBcB9XkbBAZTRLAl45uNTiOKpC6rNNXh4GzcMurAI5wDsgA0C\n8gTa6x++rVYDK7If8Rb/XCb+\n-----END PRIVATE KEY-----\n",
//   "client_email": "know-25@lucid-tiger-381422.iam.gserviceaccount.com",
//   "client_id": "114879284232478948412",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/know-25%40lucid-tiger-381422.iam.gserviceaccount.com"
// }
// ''');
//     final _httpClient = await clientViaServiceAccount(
//         _credentials, [VisionApi.cloudVisionScope]);
//     final _api = VisionApi(_httpClient);
//   }

//   Future<LocalizedObjectAnnotation?> detectProminentObject(File image) async {
//     final bytes = await image.readAsBytes();
//     String base64Image = base64Encode(bytes);
//     // get bytes from image and name it as imageBytes
//     //makesure vision api is authenticated
//     BatchAnnotateImagesRequest requests = BatchAnnotateImagesRequest(requests: [
//       AnnotateImageRequest()
//         ..image = Image(content: base64Image)
//         ..features = [Feature()..type = 'OBJECT_LOCALIZATION']
//     ]);
//     final response = await _api.images.annotate(requests);
//     final objects = response.responses?.first.localizedObjectAnnotations;
//     if (objects == null) {
//       return null;
//     }
//     final sortedObjects = List.of(objects)
//       ..sort((a, b) => a.score!.compareTo(b.score!));

//     return sortedObjects.first;
//   }
}
