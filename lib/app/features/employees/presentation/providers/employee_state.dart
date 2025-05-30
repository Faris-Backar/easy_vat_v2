import 'package:easy_vat_v2/app/features/employees/domain/entities/employee_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_state.freezed.dart';

@freezed
class EmployeeState with _$EmployeeState {
  const factory EmployeeState.initial() = _Initial;
  const factory EmployeeState.loading() = _Loading;
  const factory EmployeeState.loaded(
      {required List<EmployeeEntity> employeeList}) = _Loaded;
  const factory EmployeeState.error(String message) = _Error;
}
