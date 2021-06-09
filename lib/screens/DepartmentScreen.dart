import 'package:flutter/cupertino.dart';
import 'package:flutter_doctor24/components/category_card.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:provider/provider.dart';

class DepartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: buildCategoryList(),
      ),
    );
  }

  buildCategoryList() {
    return Consumer<DataProvider>(
      builder: (ctx, data, _) => GridView.count(
        shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: List.generate(data.categoryList.length,
              (index) => CategoryCard(data.categoryList[index]))),
    );
  }


}
