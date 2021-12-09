import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class BeyondAnimatedTableSearchBar extends StatefulWidget {
  final VoidCallback getTable;
  final TextEditingController searchController;
  final Function onChanged;
  const BeyondAnimatedTableSearchBar({
    required this.searchController,
    required this.onChanged,
    required this.getTable,
    Key? key,
  }) : super(key: key);

  @override
  _BeyondAnimatedTableSearchBarState createState() =>
      _BeyondAnimatedTableSearchBarState();
}

class _BeyondAnimatedTableSearchBarState
    extends State<BeyondAnimatedTableSearchBar> {
  bool folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: folded ? 56 : MediaQuery.of(context).size.width * 0.80,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: !folded
                  ? TextField(
                      controller: widget.searchController,
                      onChanged: (value) {
                        widget.onChanged(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixText: '  ',
                      ),
                    )
                  : null,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(folded ? 32 : 0),
                  topRight: const Radius.circular(32),
                  bottomLeft: Radius.circular(folded ? 32 : 0),
                  bottomRight: const Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    folded ? Icons.search : Icons.close,
                    color: AppColors.primaryColor,
                  ),
                ),
                onTap: () {
                  setState(() {
                    folded = !folded;
                    widget.searchController.clear();
                    widget.getTable;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
