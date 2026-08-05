import 'package:auto_route/auto_route.dart';
import 'base_dialog.dart';
import 'dialog_type.dart';

@RoutePage()
class ErrorDialogPage extends BaseDialog {
  const ErrorDialogPage({
    super.key,
    required super.title,
    required super.message,
    super.onPrimaryAction,
  }) : super(
          type: DialogType.error,
          primaryButtonText: 'OK',
        );
}