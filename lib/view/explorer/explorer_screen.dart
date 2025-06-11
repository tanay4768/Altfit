import 'package:altfit/controller/explorer_controller.dart';
import 'package:altfit/utils/widgets/plan_widget.dart';
import 'package:altfit/utils/widgets/space.dart';
import 'package:flex_dropdown/flex_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplorerScreen extends StatelessWidget{

final controller = Get.find<ExplorerController>();

final OverlayPortalController _controller1 = OverlayPortalController();
final OverlayPortalController _controller2 = OverlayPortalController();
final MenuPosition position = MenuPosition.bottomStart;

   ExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OrientationBuilder(
       builder: (BuildContext context, Orientation orientation){
    return Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          scrolledUnderElevation: 0,
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Explore", style: theme.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold
              ),),
              Text("Find your new challange", style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(child: _buildListView(orientation == Orientation.portrait, context))
              ],
            ),
          ),
        ),
      );}
    );
  }

  _buildSearchBar(BuildContext context){
    final theme = Theme.of(context);
    return TextField(
      onChanged: (value) {
        controller.searchText.value = value;
        controller.filterList();
      },
      style: theme.textTheme.bodyMedium!.copyWith(
        color: Colors.black
      ),
      decoration: InputDecoration(
        hintText: "search for plan",
        hintStyle:  theme.inputDecorationTheme.hintStyle!.copyWith(
          fontSize: 16,
        )
      ),
    );
  }


  _buildTopBar(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Space(height: 20,),
          _buildSearchBar(context),
          Space(height: 20,),
          Row(
            children: [
              Flexible(
                child: _buildDropdownChip(
                  selectedList: controller.modeSelected,
                  context: context,
                  listMap: controller.modes,
                  name: "mode",
                  controller: _controller1,
                  icon: Icon(Icons.fitness_center)
                ),
              ),
              SizedBox(width: 12), 
              Flexible(
                child: _buildDropdownChip(
                  selectedList: controller.levelSelected,
                  context: context,
                  listMap: controller.levels,
                  name: "level",
                  controller: _controller2,
                  icon: Icon(Icons.flag),
                ),
              ),
            ],
          ),
          Space(height: 20,),
        ],
      ),
    );
  }

  _buildListView(bool isPortrait, BuildContext context){
    return SafeArea(
      child: Obx(()=>
      controller.finalList.isEmpty ? Text("No plan available") :
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(()=>ListView.separated(
            clipBehavior: Clip.hardEdge,
            separatorBuilder: (context, index) => Space(height: 20,),
            itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child:index!=0 ? PlanWidget(context: context,mainview: false, program: controller.finalList[index], isPortrait: isPortrait,) : Column(
                children: [
                  _buildTopBar(context),
                  PlanWidget(context: context,mainview: false, program: controller.finalList[index], isPortrait: isPortrait,)
                ],
              ),
            );
          }, itemCount: controller.finalList.length,),
        )),
      ),
    );
  }

_buildDropdownChip({required RxList<String> selectedList, required RxList<Map<String, dynamic>> listMap, required String name, required BuildContext context, required controller, required Icon icon}){
 return RawFlexDropDown(
      controller: controller,
      dismissOnTapOutside: true, 
      menuPosition: position,
      buttonBuilder: (context, onTap) {
        return  Obx(()=> buttonWidget(
          field: name,
          list: selectedList,
          context: context,
          onTap: onTap,
          icon: icon
        ));
      },
      menuBuilder: (context, width) {
        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: menuWidget(context: context, listMap: listMap, selectedList: selectedList, name: name
          ),
        );
      },
    );
}

Widget buildChip({required String field, required bool val, required ValueChanged<bool?> onChanged}) {
  return Row(
    children: [
      Checkbox(
        value: val,
        onChanged: onChanged,
      ),
      const SizedBox(width: 8),
      Text(field),
    ],
  );
}

Widget buttonWidget({required String field, required RxList list, required BuildContext context, required VoidCallback? onTap,  required Icon icon}){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
      ),
    child: Row(
    children: [
      icon,
      Space(width: 8,),
      Text(field),
     if(list.isNotEmpty) Space(width: 8,),
      if(list.isNotEmpty) Text("(${list.length})"),
      Space(width: 8,),
      Icon(Icons.arrow_drop_down),
      
    ],
    ),
    
    ),
  );
}

Widget menuWidget({required name,required RxList<String> selectedList ,required RxList<Map<String, dynamic>> listMap, required BuildContext context, }) {
  return Container(
    width: 200,
    color: Theme.of(context).colorScheme.surface,
    child: Obx(
     ()=> ListView.separated(
        itemBuilder: (context, index) {
        final item = listMap[index];
        return buildChip(
          field: item['field'] ?? '',
          val: item['val'] ?? false,
          onChanged: (value) {
          item['val'] = value ?? false;
          final idx = listMap.indexWhere((e) => e['field'] == item['field']);
          if (idx != -1) {
            listMap[idx] = Map<String, dynamic>.from(item);
          }
          if (item['val'] == true) {
            if (!selectedList.contains(item['field'])) {
              selectedList.add(item['field']);
            }
          } else {
            selectedList.remove(item['field']);
          }
          controller.filterList();
},  
        );
        },
        separatorBuilder: (context, index) => Divider(
        color: Theme.of(context).colorScheme.onSurface,
        thickness: 1,
        height: 1,
        ),
        itemCount: listMap.length,
      ),
    ),
  );
}

}