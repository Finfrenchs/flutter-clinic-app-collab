// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_medical_records_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetMedicalRecordsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchMedicalRecord,
    required TResult Function(String name) fetchByPatientName,
    required TResult Function(int id) fetchByPatientScheduleId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchMedicalRecord,
    TResult? Function(String name)? fetchByPatientName,
    TResult? Function(int id)? fetchByPatientScheduleId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchMedicalRecord,
    TResult Function(String name)? fetchByPatientName,
    TResult Function(int id)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchMedicalRecord value) fetchMedicalRecord,
    required TResult Function(_FetchByPatientName value) fetchByPatientName,
    required TResult Function(_FetchByPatientScheduleId value)
        fetchByPatientScheduleId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult? Function(_FetchByPatientName value)? fetchByPatientName,
    TResult? Function(_FetchByPatientScheduleId value)?
        fetchByPatientScheduleId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult Function(_FetchByPatientName value)? fetchByPatientName,
    TResult Function(_FetchByPatientScheduleId value)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMedicalRecordsEventCopyWith<$Res> {
  factory $GetMedicalRecordsEventCopyWith(GetMedicalRecordsEvent value,
          $Res Function(GetMedicalRecordsEvent) then) =
      _$GetMedicalRecordsEventCopyWithImpl<$Res, GetMedicalRecordsEvent>;
}

/// @nodoc
class _$GetMedicalRecordsEventCopyWithImpl<$Res,
        $Val extends GetMedicalRecordsEvent>
    implements $GetMedicalRecordsEventCopyWith<$Res> {
  _$GetMedicalRecordsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GetMedicalRecordsEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchMedicalRecord,
    required TResult Function(String name) fetchByPatientName,
    required TResult Function(int id) fetchByPatientScheduleId,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchMedicalRecord,
    TResult? Function(String name)? fetchByPatientName,
    TResult? Function(int id)? fetchByPatientScheduleId,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchMedicalRecord,
    TResult Function(String name)? fetchByPatientName,
    TResult Function(int id)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchMedicalRecord value) fetchMedicalRecord,
    required TResult Function(_FetchByPatientName value) fetchByPatientName,
    required TResult Function(_FetchByPatientScheduleId value)
        fetchByPatientScheduleId,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult? Function(_FetchByPatientName value)? fetchByPatientName,
    TResult? Function(_FetchByPatientScheduleId value)?
        fetchByPatientScheduleId,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult Function(_FetchByPatientName value)? fetchByPatientName,
    TResult Function(_FetchByPatientScheduleId value)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetMedicalRecordsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchMedicalRecordImplCopyWith<$Res> {
  factory _$$FetchMedicalRecordImplCopyWith(_$FetchMedicalRecordImpl value,
          $Res Function(_$FetchMedicalRecordImpl) then) =
      __$$FetchMedicalRecordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchMedicalRecordImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsEventCopyWithImpl<$Res, _$FetchMedicalRecordImpl>
    implements _$$FetchMedicalRecordImplCopyWith<$Res> {
  __$$FetchMedicalRecordImplCopyWithImpl(_$FetchMedicalRecordImpl _value,
      $Res Function(_$FetchMedicalRecordImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchMedicalRecordImpl implements _FetchMedicalRecord {
  const _$FetchMedicalRecordImpl();

  @override
  String toString() {
    return 'GetMedicalRecordsEvent.fetchMedicalRecord()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchMedicalRecordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchMedicalRecord,
    required TResult Function(String name) fetchByPatientName,
    required TResult Function(int id) fetchByPatientScheduleId,
  }) {
    return fetchMedicalRecord();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchMedicalRecord,
    TResult? Function(String name)? fetchByPatientName,
    TResult? Function(int id)? fetchByPatientScheduleId,
  }) {
    return fetchMedicalRecord?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchMedicalRecord,
    TResult Function(String name)? fetchByPatientName,
    TResult Function(int id)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) {
    if (fetchMedicalRecord != null) {
      return fetchMedicalRecord();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchMedicalRecord value) fetchMedicalRecord,
    required TResult Function(_FetchByPatientName value) fetchByPatientName,
    required TResult Function(_FetchByPatientScheduleId value)
        fetchByPatientScheduleId,
  }) {
    return fetchMedicalRecord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult? Function(_FetchByPatientName value)? fetchByPatientName,
    TResult? Function(_FetchByPatientScheduleId value)?
        fetchByPatientScheduleId,
  }) {
    return fetchMedicalRecord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult Function(_FetchByPatientName value)? fetchByPatientName,
    TResult Function(_FetchByPatientScheduleId value)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) {
    if (fetchMedicalRecord != null) {
      return fetchMedicalRecord(this);
    }
    return orElse();
  }
}

abstract class _FetchMedicalRecord implements GetMedicalRecordsEvent {
  const factory _FetchMedicalRecord() = _$FetchMedicalRecordImpl;
}

/// @nodoc
abstract class _$$FetchByPatientNameImplCopyWith<$Res> {
  factory _$$FetchByPatientNameImplCopyWith(_$FetchByPatientNameImpl value,
          $Res Function(_$FetchByPatientNameImpl) then) =
      __$$FetchByPatientNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$FetchByPatientNameImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsEventCopyWithImpl<$Res, _$FetchByPatientNameImpl>
    implements _$$FetchByPatientNameImplCopyWith<$Res> {
  __$$FetchByPatientNameImplCopyWithImpl(_$FetchByPatientNameImpl _value,
      $Res Function(_$FetchByPatientNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$FetchByPatientNameImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchByPatientNameImpl implements _FetchByPatientName {
  const _$FetchByPatientNameImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'GetMedicalRecordsEvent.fetchByPatientName(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByPatientNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByPatientNameImplCopyWith<_$FetchByPatientNameImpl> get copyWith =>
      __$$FetchByPatientNameImplCopyWithImpl<_$FetchByPatientNameImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchMedicalRecord,
    required TResult Function(String name) fetchByPatientName,
    required TResult Function(int id) fetchByPatientScheduleId,
  }) {
    return fetchByPatientName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchMedicalRecord,
    TResult? Function(String name)? fetchByPatientName,
    TResult? Function(int id)? fetchByPatientScheduleId,
  }) {
    return fetchByPatientName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchMedicalRecord,
    TResult Function(String name)? fetchByPatientName,
    TResult Function(int id)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) {
    if (fetchByPatientName != null) {
      return fetchByPatientName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchMedicalRecord value) fetchMedicalRecord,
    required TResult Function(_FetchByPatientName value) fetchByPatientName,
    required TResult Function(_FetchByPatientScheduleId value)
        fetchByPatientScheduleId,
  }) {
    return fetchByPatientName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult? Function(_FetchByPatientName value)? fetchByPatientName,
    TResult? Function(_FetchByPatientScheduleId value)?
        fetchByPatientScheduleId,
  }) {
    return fetchByPatientName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult Function(_FetchByPatientName value)? fetchByPatientName,
    TResult Function(_FetchByPatientScheduleId value)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) {
    if (fetchByPatientName != null) {
      return fetchByPatientName(this);
    }
    return orElse();
  }
}

abstract class _FetchByPatientName implements GetMedicalRecordsEvent {
  const factory _FetchByPatientName(final String name) =
      _$FetchByPatientNameImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$FetchByPatientNameImplCopyWith<_$FetchByPatientNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchByPatientScheduleIdImplCopyWith<$Res> {
  factory _$$FetchByPatientScheduleIdImplCopyWith(
          _$FetchByPatientScheduleIdImpl value,
          $Res Function(_$FetchByPatientScheduleIdImpl) then) =
      __$$FetchByPatientScheduleIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchByPatientScheduleIdImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsEventCopyWithImpl<$Res,
        _$FetchByPatientScheduleIdImpl>
    implements _$$FetchByPatientScheduleIdImplCopyWith<$Res> {
  __$$FetchByPatientScheduleIdImplCopyWithImpl(
      _$FetchByPatientScheduleIdImpl _value,
      $Res Function(_$FetchByPatientScheduleIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchByPatientScheduleIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchByPatientScheduleIdImpl implements _FetchByPatientScheduleId {
  const _$FetchByPatientScheduleIdImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'GetMedicalRecordsEvent.fetchByPatientScheduleId(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByPatientScheduleIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByPatientScheduleIdImplCopyWith<_$FetchByPatientScheduleIdImpl>
      get copyWith => __$$FetchByPatientScheduleIdImplCopyWithImpl<
          _$FetchByPatientScheduleIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchMedicalRecord,
    required TResult Function(String name) fetchByPatientName,
    required TResult Function(int id) fetchByPatientScheduleId,
  }) {
    return fetchByPatientScheduleId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchMedicalRecord,
    TResult? Function(String name)? fetchByPatientName,
    TResult? Function(int id)? fetchByPatientScheduleId,
  }) {
    return fetchByPatientScheduleId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchMedicalRecord,
    TResult Function(String name)? fetchByPatientName,
    TResult Function(int id)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) {
    if (fetchByPatientScheduleId != null) {
      return fetchByPatientScheduleId(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchMedicalRecord value) fetchMedicalRecord,
    required TResult Function(_FetchByPatientName value) fetchByPatientName,
    required TResult Function(_FetchByPatientScheduleId value)
        fetchByPatientScheduleId,
  }) {
    return fetchByPatientScheduleId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult? Function(_FetchByPatientName value)? fetchByPatientName,
    TResult? Function(_FetchByPatientScheduleId value)?
        fetchByPatientScheduleId,
  }) {
    return fetchByPatientScheduleId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchMedicalRecord value)? fetchMedicalRecord,
    TResult Function(_FetchByPatientName value)? fetchByPatientName,
    TResult Function(_FetchByPatientScheduleId value)? fetchByPatientScheduleId,
    required TResult orElse(),
  }) {
    if (fetchByPatientScheduleId != null) {
      return fetchByPatientScheduleId(this);
    }
    return orElse();
  }
}

abstract class _FetchByPatientScheduleId implements GetMedicalRecordsEvent {
  const factory _FetchByPatientScheduleId(final int id) =
      _$FetchByPatientScheduleIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$FetchByPatientScheduleIdImplCopyWith<_$FetchByPatientScheduleIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetMedicalRecordsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetMedicalRecordsResponseModel data) loaded,
    required TResult Function(
            GetMedicalRecordsByPatientScheduleIdResponseModel data)
        loadedByPatientScheduleId,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult? Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedByPatientScheduleId value)
        loadedByPatientScheduleId,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMedicalRecordsStateCopyWith<$Res> {
  factory $GetMedicalRecordsStateCopyWith(GetMedicalRecordsState value,
          $Res Function(GetMedicalRecordsState) then) =
      _$GetMedicalRecordsStateCopyWithImpl<$Res, GetMedicalRecordsState>;
}

/// @nodoc
class _$GetMedicalRecordsStateCopyWithImpl<$Res,
        $Val extends GetMedicalRecordsState>
    implements $GetMedicalRecordsStateCopyWith<$Res> {
  _$GetMedicalRecordsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GetMedicalRecordsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetMedicalRecordsResponseModel data) loaded,
    required TResult Function(
            GetMedicalRecordsByPatientScheduleIdResponseModel data)
        loadedByPatientScheduleId,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult? Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedByPatientScheduleId value)
        loadedByPatientScheduleId,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetMedicalRecordsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GetMedicalRecordsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetMedicalRecordsResponseModel data) loaded,
    required TResult Function(
            GetMedicalRecordsByPatientScheduleIdResponseModel data)
        loadedByPatientScheduleId,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult? Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedByPatientScheduleId value)
        loadedByPatientScheduleId,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GetMedicalRecordsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetMedicalRecordsResponseModel data});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetMedicalRecordsResponseModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data);

  @override
  final GetMedicalRecordsResponseModel data;

  @override
  String toString() {
    return 'GetMedicalRecordsState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetMedicalRecordsResponseModel data) loaded,
    required TResult Function(
            GetMedicalRecordsByPatientScheduleIdResponseModel data)
        loadedByPatientScheduleId,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult? Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedByPatientScheduleId value)
        loadedByPatientScheduleId,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements GetMedicalRecordsState {
  const factory _Loaded(final GetMedicalRecordsResponseModel data) =
      _$LoadedImpl;

  GetMedicalRecordsResponseModel get data;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedByPatientScheduleIdImplCopyWith<$Res> {
  factory _$$LoadedByPatientScheduleIdImplCopyWith(
          _$LoadedByPatientScheduleIdImpl value,
          $Res Function(_$LoadedByPatientScheduleIdImpl) then) =
      __$$LoadedByPatientScheduleIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetMedicalRecordsByPatientScheduleIdResponseModel data});
}

/// @nodoc
class __$$LoadedByPatientScheduleIdImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsStateCopyWithImpl<$Res,
        _$LoadedByPatientScheduleIdImpl>
    implements _$$LoadedByPatientScheduleIdImplCopyWith<$Res> {
  __$$LoadedByPatientScheduleIdImplCopyWithImpl(
      _$LoadedByPatientScheduleIdImpl _value,
      $Res Function(_$LoadedByPatientScheduleIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedByPatientScheduleIdImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetMedicalRecordsByPatientScheduleIdResponseModel,
    ));
  }
}

/// @nodoc

class _$LoadedByPatientScheduleIdImpl implements _LoadedByPatientScheduleId {
  const _$LoadedByPatientScheduleIdImpl(this.data);

  @override
  final GetMedicalRecordsByPatientScheduleIdResponseModel data;

  @override
  String toString() {
    return 'GetMedicalRecordsState.loadedByPatientScheduleId(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedByPatientScheduleIdImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedByPatientScheduleIdImplCopyWith<_$LoadedByPatientScheduleIdImpl>
      get copyWith => __$$LoadedByPatientScheduleIdImplCopyWithImpl<
          _$LoadedByPatientScheduleIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetMedicalRecordsResponseModel data) loaded,
    required TResult Function(
            GetMedicalRecordsByPatientScheduleIdResponseModel data)
        loadedByPatientScheduleId,
    required TResult Function(String message) error,
  }) {
    return loadedByPatientScheduleId(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult? Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult? Function(String message)? error,
  }) {
    return loadedByPatientScheduleId?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedByPatientScheduleId != null) {
      return loadedByPatientScheduleId(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedByPatientScheduleId value)
        loadedByPatientScheduleId,
    required TResult Function(_Error value) error,
  }) {
    return loadedByPatientScheduleId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult? Function(_Error value)? error,
  }) {
    return loadedByPatientScheduleId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadedByPatientScheduleId != null) {
      return loadedByPatientScheduleId(this);
    }
    return orElse();
  }
}

abstract class _LoadedByPatientScheduleId implements GetMedicalRecordsState {
  const factory _LoadedByPatientScheduleId(
          final GetMedicalRecordsByPatientScheduleIdResponseModel data) =
      _$LoadedByPatientScheduleIdImpl;

  GetMedicalRecordsByPatientScheduleIdResponseModel get data;
  @JsonKey(ignore: true)
  _$$LoadedByPatientScheduleIdImplCopyWith<_$LoadedByPatientScheduleIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GetMedicalRecordsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GetMedicalRecordsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetMedicalRecordsResponseModel data) loaded,
    required TResult Function(
            GetMedicalRecordsByPatientScheduleIdResponseModel data)
        loadedByPatientScheduleId,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult? Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetMedicalRecordsResponseModel data)? loaded,
    TResult Function(GetMedicalRecordsByPatientScheduleIdResponseModel data)?
        loadedByPatientScheduleId,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedByPatientScheduleId value)
        loadedByPatientScheduleId,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedByPatientScheduleId value)?
        loadedByPatientScheduleId,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GetMedicalRecordsState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
