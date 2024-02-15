import 'package:assignment_app/core/widgets/exception_widget.dart';
import 'package:assignment_app/core/widgets/loading_widget.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/categories_and_sliders.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_categories_and_sliders_cubit/get_categories_and_sliders_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/get_categories_and_sliders_cubit/get_categories_and_sliders_cubit.dart';

class CategoriesAndSlidersBlocBuilder extends StatelessWidget {
  final Widget Function(CategoriesAndSliders categoriesAndSliders) successBuilder;
  const CategoriesAndSlidersBlocBuilder({
    super.key,
    required this.successBuilder,  
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesAndSlidersCubit,GetCategoriesAndSlidersCubitStates>(
      builder: (context, state) {
        if(state is GetCategoriesAndSlidersSuccessState){
          return successBuilder(state.categoriesAndSliders);
        }
        if(state is GetCategoriesAndSlidersFailedState){
          return ExceptionWidget(message: state.message);
        }
        return const LoadingWidget();

      },
    );
  }
}