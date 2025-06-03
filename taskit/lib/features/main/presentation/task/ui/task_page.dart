import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../config/app/app_color.dart';

class TaskPage extends ConsumerStatefulWidget {
  const TaskPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskPageState();
}

class _TaskPageState extends ConsumerState<TaskPage> {
  int selectedIndex = 0;
  List<bool> checkedIndexs = List<bool>.generate(10, (i) => false);
  final categories = List<String>.generate(10, (index) => "Cate $index");
  final tasks = List<String>.generate(10, (index) => "Task $index");
  final expandedIndexs = List<bool>.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor(context).secondaryContainer,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'January 10',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontFamily: 'Inter Tight',
                            color: AppColor(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: AppColor(context).primaryText,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    width: double.infinity,
                    height: 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: AppColor(context).secondaryContainer,
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2.0,
                            offset: Offset(4, 4),
                            spreadRadius: 0.3,
                          )
                        ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Today task insights',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontFamily: 'Inter Tight',
                                              color: AppColor(context)
                                                  .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        '20%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontFamily: 'Inter Tight',
                                              color: AppColor(context)
                                                  .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: LinearProgressIndicator(
                                      value: 0.4,
                                      minHeight: 8.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                      backgroundColor:
                                          AppColor(context).primaryContainer,
                                      color: AppColor(context).secondary,
                                    ),
                                  ),
                                ]),
                          )
                        ])),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ChoiceChip.elevated(
                              label: Text(categories[index]),
                              padding: EdgeInsets.zero,
                              elevation: 1,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    fontFamily: 'Inter Tight',
                                    color: selectedIndex == index
                                        ? AppColor(context).onPrimary
                                        : AppColor(context).secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              selected: selectedIndex == index,
                              backgroundColor:
                                  AppColor(context).secondaryContainer,
                              selectedColor: AppColor(context).primary,
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onSelected: (value) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              showCheckmark: false,
                            ),
                          );
                        })),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text(
                    'Today',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontFamily: 'Inter Tight',
                          color: AppColor(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w700,
                        ),
                  )),
              ListView.builder(
                  itemCount: tasks.length,
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
                        child: Material(
                          elevation: 1,
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(12)),
                          ),
                          child: Slidable(
                            endActionPane:
                                ActionPane(motion: DrawerMotion(), children: [
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: Colors.indigoAccent,
                                foregroundColor: AppColor(context).onPrimary,
                                icon: Icons.info_outline_rounded,
                                label: 'Detail',
                                borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(12)),
                              ),
                            ]),
                            child: ExpansionTile(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12)),
                                ),
                                backgroundColor:
                                    AppColor(context).primaryContainer,
                                onExpansionChanged: (value) {
                                  setState(() {
                                    expandedIndexs[index] = value;
                                  });
                                },
                                title: Text(
                                  tasks[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontFamily: 'Inter Tight',
                                        color: AppColor(context).primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                subtitle: Text(tasks[index]),
                                leading: RoundCheckBox(
                                    checkedWidget: Icon(
                                      Icons.check_outlined,
                                      color: AppColor(context).onPrimary,
                                      size: 20,
                                    ),
                                    checkedColor: Colors.grey,
                                    uncheckedColor:
                                        AppColor(context).primaryContainer,
                                    isChecked: checkedIndexs[index],
                                    size: 25,
                                    borderColor: Colors.black12,
                                    onTap: (value) {
                                      setState(() {
                                        checkedIndexs[index] = value!;
                                      });
                                    }),
                                trailing: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                  child: SizedBox(
                                    height: 50,
                                    width: 40,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.flag_outlined,
                                          color:
                                              AppColor(context).secondaryText,
                                        ),
                                        Icon(
                                          expandedIndexs[index]
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down,
                                          color:
                                              AppColor(context).secondaryText,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                children: [
                                  Icon(
                                    Icons.abc,
                                    color: Colors.red,
                                  )
                                ]),
                          ),
                        ));
                  })
            ],
          )),
        ));
  }
}
