
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskit/config/app/app_color.dart';

import '../../domain/model/task_model.dart';



class TaskitItem extends ConsumerStatefulWidget{
  final TaskModel model;
  final Function(TaskModel,String) onChanged;
  const TaskitItem({super.key,required this.model, required this.onChanged});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_TaskitItem();
}
class _TaskitItem extends ConsumerState<TaskitItem>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor(context).secondaryContainer,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                1.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor(context).secondary,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        widget.model.category,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'Inter',
                          color: AppColor(context).onSurface,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: AppColor(context).secondaryContainer,
                      ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                      AppColor(context).onSurface,
                    ),
                    child: Checkbox(
                      value: widget.model.status=="completed"?true:false,
                      onChanged: (value){
                          widget.onChanged(widget.model,value==true?"completed":"pending");
                      },
                      side: BorderSide(
                        width: 2,
                        color: AppColor(context).onSurface,
                      ),
                      activeColor: AppColor(context).primary,
                      checkColor: AppColor(context).onPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.0),
              Text(
                widget.model.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFamily: 'Inter Tight',
                  letterSpacing: 0.0,
                  color: AppColor(context).primaryText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.access_time,
                    color: AppColor(context).secondaryText,
                    size: 16.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      DateFormat('HH:mm').format(widget.model.dueDate),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        color: AppColor(context).secondaryText,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    height: 26.0,
                    decoration: BoxDecoration(
                      color: widget.model.priority=='high'?
                      AppColor(context).error:(
                          widget.model.priority=='medium'?Colors.amber:
                          (widget.model.priority=='low'?Colors.green:Colors.blueGrey)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              widget.model.priority,
                              style: Theme.of(context).textTheme
                                  .bodySmall?.copyWith(
                                fontFamily: 'Inter',
                                color: AppColor(context).onSecondary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}