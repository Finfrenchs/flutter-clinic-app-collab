import 'package:flutter/material.dart';
import 'package:flutter_clinic_app/core/constants/colors.dart';
import 'package:flutter_clinic_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinic_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_clinic_app/data/datasources/master_remote_datasource.dart';
import 'package:flutter_clinic_app/data/datasources/medical_records_remote_datasource.dart';
import 'package:flutter_clinic_app/data/datasources/midtrans_remote_datasource.dart';
import 'package:flutter_clinic_app/data/datasources/payment_detail_remote_datasource.dart';
import 'package:flutter_clinic_app/data/datasources/schedule_patient_remote_datasource.dart';
import 'package:flutter_clinic_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_clinic_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_clinic_app/presentation/home/pages/dashboard.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/create_medical_record/create_medical_record_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/create_patient/create_patient_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/create_payment_detail/create_payment_detail_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/create_reserve_patient/create_reserve_patient_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_doctor/data_doctor_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_doctor_schedule/data_doctor_schedule_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_layanan_obat/data_layanan_obat_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_patients/data_patients_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/get_medical_records/get_medical_records_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/get_payment_detail/get_payment_detail_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/get_schedule_patient/get_schedule_patient_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/qris/qris_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/update_patient_schedule/update_patient_schedule_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataDoctorBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataPatientsBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataDoctorScheduleBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataLayananObatBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreatePatientBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CreateReservePatientBloc(SchedulePatientRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetSchedulePatientBloc(SchedulePatientRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetMedicalRecordsBloc(MedicalRecordsRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CreateMedicalRecordBloc(MedicalRecordsRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              UpdatePatientScheduleBloc(SchedulePatientRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => QrisBloc(MidtransRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetPaymentDetailBloc(PaymentDetailRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CreatePaymentDetailBloc(PaymentDetailRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: AuthLocalDataSource().isUserLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasData && snapshot.data == true) {
              return const DashboardPage();
            }
            return const LoginPage();
          },
        ),
      ),
    );
  }
}
