import 'package:flutter/material.dart';

import '../../../core/core.dart';

enum PasientStatus {
  waiting('waiting'),
  processed('processed'),
  processing('processing'),
  rejected('rejected'),
  completed('completed'),
  onHold('on hold'),
  notFound('Unknown status');

  final String value;
  const PasientStatus(this.value);

  factory PasientStatus.fromValue(String value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => PasientStatus.notFound,
    );
  }
}

extension PasientStatusExtension on PasientStatus {
  Color get color {
    switch (this) {
      case PasientStatus.waiting:
        return AppColors.orderIsWaiting;
      case PasientStatus.processed:
        return AppColors.orderIsProcessed;
      case PasientStatus.processing:
        return AppColors.orderIsProcessing;
      case PasientStatus.completed:
        return AppColors.orderIsCompleted;
      case PasientStatus.rejected:
        return AppColors.orderIsRejected;
      case PasientStatus.onHold:
        return AppColors.orderIsOnHold;
      default:
        throw Exception('Unknown status');
    }
  }

  Color get backgroundColor {
    switch (this) {
      case PasientStatus.waiting:
        return AppColors.orderIsWaiting.withOpacity(0.2);
      case PasientStatus.processed:
        return AppColors.orderIsProcessed.withOpacity(0.2);
      case PasientStatus.processing:
        return AppColors.orderIsProcessing.withOpacity(0.2);
      case PasientStatus.completed:
        return AppColors.orderIsCompleted.withOpacity(0.2);
      case PasientStatus.rejected:
        return AppColors.orderIsRejected.withOpacity(0.2);
      case PasientStatus.onHold:
        return AppColors.orderIsOnHold.withOpacity(0.2);
      default:
        throw Exception('Unknown status');
    }
  }
}
