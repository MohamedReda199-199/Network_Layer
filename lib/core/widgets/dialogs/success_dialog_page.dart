import 'package:auto_route/auto_route.dart';
import 'base_dialog.dart';
import 'dialog_type.dart';

@RoutePage()
class SuccessDialogPage extends BaseDialog {
  const SuccessDialogPage({
    super.key,
    required super.title,
    required super.message,
    super.onPrimaryAction,
  }) : super(type: DialogType.success, primaryButtonText: 'OK');
}
