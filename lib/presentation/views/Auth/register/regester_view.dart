import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'manager/register_cubit.dart';
import '../../../../zoom_drawer.dart';
import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess("Register Success");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const HomeView()), // Change to your home screen widget
          );
        } else if (state is RegisterLoadingState) {
          EasyLoading.show(status: 'Loading...');
        } else if (state is RegisterErrorState) {
          if (state.error.contains("email has already been taken")) {
            EasyLoading.showError("This email is already registered. Try another.");
          } else {
            EasyLoading.showError(state.error);
          }
        }
      },
      builder: (context, state) {
        return RegisterViewBody();
      },
    );
  }
}
