import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/dashboard.dart';
import '../blocs/dashboard/dashboard_bloc.dart';
import '../widgets/widgets.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final dashBoardBloc = context.read<DashBoardBloc>();
    return Stack(
      children: [
        BlocBuilder<DashBoardBloc, DashboardState>(
          builder: (context, state) {
            return state.when(
                initial: () => Container(),
                loading: () => const LoadingCustomWidget(),
                success: (DashBoard data) => HomeSliderWidget(
                    promotedBusinesses: data.promotedBusinesses),
                failure: (_) => Container());
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 150, bottom: 20),
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: const SearchBarHomeWidget(),
        ),
      ],
    );
  }
}

class LoadingCustomWidget extends StatelessWidget {
  const LoadingCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        top: 50, left: 170, child: CircularProgressIndicator());
  }
}
