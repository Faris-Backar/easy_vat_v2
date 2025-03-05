import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/employees/data/repository/employee_repository_impl.dart';
import 'package:easy_vat_v2/app/features/employees/domain/repository/employee_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/employees/domain/usecase/get_employees_usecase.dart';
import 'package:easy_vat_v2/app/features/employees/presentation/providers/employee_state.dart';

final employeeRepositoryProvider = Provider<EmployeeRepository>((ref) {
  return EmployeeRepositoryImpl(client: ref.read(dioProvider));
});

final getEmployeeUsecaseProvider = Provider<GetEmployeesUsecase>((ref) {
  return GetEmployeesUsecase(
      employeeRepository: ref.read(employeeRepositoryProvider));
});

final employeeProvider =
    StateNotifierProvider<EmployeeNotifier, EmployeeState>((ref) {
  return EmployeeNotifier(
      getEmployeesUsecase: ref.read(getEmployeeUsecaseProvider));
});

class EmployeeNotifier extends StateNotifier<EmployeeState> {
  final GetEmployeesUsecase getEmployeesUsecase;
  EmployeeNotifier({required this.getEmployeesUsecase})
      : super(EmployeeState.initial());

  getEmployees() async {
    state = EmployeeState.loading();
    final result = await getEmployeesUsecase.call(params: NoParams());
    result.fold(
      (l) => EmployeeState.error(l.message),
      (r) => EmployeeState.loaded(employeeList: r),
    );
  }
}
