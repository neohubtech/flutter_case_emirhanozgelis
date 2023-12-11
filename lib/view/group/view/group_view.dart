import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intertech/constants/app_strings.dart';
import 'package:intertech/core/theme/app_text_styles.dart';
import 'package:intertech/core/state/base_state.dart';
import 'package:intertech/core/view/base_view.dart';
import 'package:intertech/view/group/model/banner_model/banner_model.dart';
import 'package:intertech/view/group/model/combined_model/combined_model.dart';
import 'package:intertech/view/group/viewmodel/group_view_model.dart';
import 'package:intertech/widgets/appbar/app_appbar.dart';
import 'package:intertech/widgets/cards/bottomsheet_item_card.dart';
import 'package:intertech/widgets/cards/item_list_card.dart';
import 'package:intertech/widgets/loading/shimmer_loading.dart';

// This class represents the GroupScreen, which is a StatefulWidget
class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

// State class for the GroupScreen, utilizes SingleTickerProviderStateMixin for animation
class _GroupScreenState extends BaseState<GroupScreen>
    with SingleTickerProviderStateMixin {
  late GroupViewModel viewModel; // ViewModel for managing state

  late AnimationController _animationController; // Controller for animations
  late Animation<double> _animation; // Animation for list items

  @override
  void initState() {
    super.initState();
    // Initializing animation controller with a duration of 2 seconds
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Tween animation from 0 to 1
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // BaseView that encapsulates the main view
    return BaseView<GroupViewModel>(
      viewModel: GroupViewModel(), // Initializing the ViewModel
      onPageBuilder: (context, value) => Observer(
        builder: (context) => ShimmerLoading(
          isLoading: viewModel.isLoading,
          child: pageBody(), // Building the main content of the page
        ),
      ),
      onModelReady: (model) {
        viewModel = model;
        viewModel.fetchData(); // Fetching data for the ViewModel
      },
    );
  }

  // Widget that represents the main content of the page
  Widget pageBody() {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppStrings.shared.groupList, // Title of the app bar
        actions: [
          Padding(
            padding: EdgeInsets.only(right: dynamicWidth(0.03)),
            child: Observer(
              builder: (context) => InkWell(
                onTap: () {
                  // Handling the action when the user taps on the icon
                  if (viewModel.selectedItems.isNotEmpty) {
                    itemListBottomSheet(context); // Shows the bottom sheet with selected items
                  } else {
                    emptyItemListSnackbar(context); // Shows a snackbar for empty selection
                  }
                },
                child: Badge(
                  isLabelVisible: viewModel.selectedItems.isNotEmpty,
                  label: Text(viewModel.selectedItems.length.toString()),
                  child: const Icon(Icons.list),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: dynamicHeight(1),
        width: dynamicWidth(1),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: dynamicHeight(0.01), horizontal: dynamicWidth(0.02)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sliderArea(), // Widget for displaying carousel slider
              itemListWidget(), // Widget for displaying the list of items
            ],
          ),
        ),
      ),
    );
  }

  // Function to display a snackbar for empty selected items
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      emptyItemListSnackbar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppStrings.shared.pleaseSelectaNItem),
        action: SnackBarAction(
          label: AppStrings.shared.close,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  // Function to display the bottom sheet with selected items
  Future<void> itemListBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: dynamicHeight(0.01)),
          height: dynamicHeight(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.shared.itemsYouChoose,
                style: AppTextStyles.shared.titleTextStyle,
              ),
              const Divider(),
              Expanded(
                child: Observer(
                  builder: (context) => GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: viewModel.selectedItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final selected = viewModel.selectedItems[index];
                      return BottomSheetItemCard(
                        selected: selected,
                        viewModel: viewModel,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // Widget for displaying the carousel slider
  Widget sliderArea() {
    return SizedBox(
      width: dynamicWidth(0.9),
      height: dynamicHeight(0.3),
      child: Observer(
        builder: (context) => CarouselSlider(
          options: CarouselOptions(
            height: dynamicHeight(0.3),
            viewportFraction: 0.5,
            padEnds: false,
            autoPlay: true,
            onPageChanged: (index, reason) {},
            reverse: false,
            enableInfiniteScroll: true,
          ),
          items: List.generate(
            viewModel.groupData.bannerList.length,
            (index) => _buildBannerItem(viewModel.groupData.bannerList[index]),
          ),
        ),
      ),
    );
  }

  // Widget to build a banner item in the carousel
  Widget _buildBannerItem(BannerModel bannerItem) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Overlay with gradient for image blending
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 150, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                bannerItem.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        // Text overlay on the banner
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            bannerItem.name,
            style: AppTextStyles.shared.titleTextStyle.copyWith(fontSize: 13),
          ),
        )
      ],
    );
  }

  // Widget for displaying the list of items
  Widget itemListWidget() {
    return Observer(
      builder: (context) => Expanded(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => ListView.builder(
            itemCount: viewModel.groupData.combinedList.length,
            itemBuilder: (context, index) {
              // Calculating animation value based on the controller's value
              final animationValue = _animationController.value *
                  (index + 1) /
                  viewModel.groupData.combinedList.length;

              return Opacity(
                opacity: _animation.value > animationValue ? 1 : 0,
                child: Transform.translate(
                  offset: Offset(
                    dynamicWidth(1.0) * (1 - _animation.value),
                    0,
                  ),
                  child: itemCard(
                    viewModel.groupData.combinedList[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget to display an item card in the list
  Widget itemCard(CombinedModel combinedItem) {
    return InkWell(
      onTap: () => viewModel.toggleSelectedItem(combinedItem),
      child: ItemListCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image of the combined item
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                combinedItem.imageUrl,
                width: dynamicWidth(0.15),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Displaying name and explanation of the combined item
                    Text(
                      combinedItem.name,
                      style: AppTextStyles.shared.titleTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      combinedItem.explanation,
                      style: AppTextStyles.shared.bodyTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            // Icon to represent selected or unselected state of the item
            Observer(
              builder: (context) => Icon(
                viewModel.selectedItems.contains(combinedItem)
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
