import 'package:fluttertoast/fluttertoast.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/enums/status.dart';

toastInfo({
  required String msg,
  required Status status,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: status == Status.error
        ? AppColors.secondaryColor
        : AppColors.primaryColor,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
  );
}
