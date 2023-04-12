import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:talent_pro_assignment/view/home/home_view_model.dart';
import 'package:talent_pro_assignment/widget/widgets.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => HomePageView(),
      viewModel: HomeViewModel()
    );
  }
}

// ignore: must_be_immutable
class HomePageView extends StatelessView<HomeViewModel> {

  late BuildContext _context;
  late HomeViewModel _viewModel;

  HomePageView({super.key});

  @override
  Widget render(BuildContext context, HomeViewModel viewModel) {
    _context = context;
    _viewModel = viewModel;

    return WidgetHUD(
      showHUD: viewModel.isLoading,
      hud: Widgets().progressBar(),
      builder: (context) => Scaffold(
        body: body(),
      )
    );
  }

  body() {
    return const Center(
      child: Text('Home Page'),
    );
  }
}
