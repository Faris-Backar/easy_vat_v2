import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/employees/data/repository/employee_repository_impl.dart';
import 'package:easy_vat_v2/app/features/employees/domain/repository/employee_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/employees/domain/usecase/get_employees_usecase.dart';
import 'package:easy_vat_v2/app/features/employees/presentation/providers/employee_state.dart';

final employeeRepositoryProvider = Provider<EmployeeRepository>((ref) {
  return EmployeeRepositoryImpl();
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
    try {
      final result = await getEmployeesUsecase.call(params: NoParams());
      result.fold(
        (l) => state = EmployeeState.error(l.message),
        (r) => state = EmployeeState.loaded(employeeList: r),
      );
    } on Failure catch (e) {
      state = EmployeeState.error(e.message.toString());
    } catch (e) {
      state = EmployeeState.error(e.toString());
    }
  }
}
