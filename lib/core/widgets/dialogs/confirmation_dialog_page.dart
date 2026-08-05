import 'package:auto_route/auto_route.dart';
import 'base_dialog.dart';
import 'dialog_type.dart';

@RoutePage()
class ConfirmationDialogPage extends BaseDialog {
  const ConfirmationDialogPage({
    super.key,
    required super.title,
    required super.message,
    super.primaryButtonText,
    super.secondaryButtonText,
    super.onPrimaryAction,
    super.onSecondaryAction,
    super.isDismissible,
  }) : super(type: DialogType.confirmation);
}
