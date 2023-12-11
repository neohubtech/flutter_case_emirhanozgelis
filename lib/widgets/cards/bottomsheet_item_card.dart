import 'package:flutter/material.dart';
import 'package:intertech/core/theme/app_text_styles.dart';
import 'package:intertech/view/group/model/combined_model/combined_model.dart';
import 'package:intertech/view/group/viewmodel/group_view_model.dart';

class BottomSheetItemCard extends StatelessWidget {
  const BottomSheetItemCard({
    super.key,
    required this.selected,
    required this.viewModel,
  });

  final CombinedModel selected;
  final GroupViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  selected.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  viewModel.toggleSelectedItem(selected);
                  if (viewModel.selectedItems.isEmpty) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          selected.name,
          style: AppTextStyles.shared.bodyTextStyle,
        )
      ],
    );
  }
}
