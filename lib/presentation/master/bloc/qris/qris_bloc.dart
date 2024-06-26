import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/midtrans_remote_datasource.dart';
import '../../../../data/models/response/qris_response_model.dart';
import '../../../../data/models/response/qris_status_response_mode.dart';

part 'qris_event.dart';
part 'qris_state.dart';
part 'qris_bloc.freezed.dart';

class QrisBloc extends Bloc<QrisEvent, QrisState> {
  final MidtransRemoteDatasource midtransRemoteDatasource;
  QrisBloc(
    this.midtransRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GenerateQRCode>((event, emit) async {
      emit(const _Loading());
      final response = await midtransRemoteDatasource.generateQRCode(
        event.orderId,
        event.grossAmount,
      );

      emit(QrisState.qrisResponse(response));
    });

    on<_CheckPaymentStatus>(
      (event, emit) async {
        // emit(_Loading());
        final response =
            await midtransRemoteDatasource.checkPaymentStatus(event.orderId);

        if (response.transactionStatus == 'settlement') {
          emit(const _Success('Pembayaran Berhasil.'));
        }
      },
    );
  }
}
