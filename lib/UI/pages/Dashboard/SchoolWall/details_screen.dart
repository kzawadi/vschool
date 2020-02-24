import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ourESchool/UI/pages/Dashboard/SchoolWall/add_edit_screen.dart';
import 'package:ourESchool/core/blocs/todos/todos_bloc.dart';
import 'package:ourESchool/core/blocs/todos/todos_event.dart';
import 'package:ourESchool/core/blocs/todos/todos_state.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  DetailsScreen({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallsBloc, WallState>(
      builder: (context, state) {
        final wall = (state as WallLoaded)
            .walls
            .firstWhere((wall) => wall.id == id, orElse: () => null);
        return Scaffold(
          appBar: AppBar(
            title: Text('Wall Details'),
            actions: [
              IconButton(
                tooltip: 'Delete Wall',
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<WallsBloc>(context).dispatch(DeleteWall(wall));
                  Navigator.pop(context, wall);
                },
              )
            ],
          ),
          body: wall == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.only(right: 8.0),
                          //   child: Checkbox(
                          //       value: wall.complete,
                          //       onChanged: (_) {
                          //         BlocProvider.of<TodosBloc>(context).add(
                          //           UpdateTodo(
                          //             wall.copyWith(complete: !wall.complete),
                          //           ),
                          //         );
                          //       }),
                          // ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: '${wall.id}__heroTag',
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 16.0,
                                    ),
                                    child: Text(
                                      wall.name,
                                      style:
                                          Theme.of(context).textTheme.headline,
                                    ),
                                  ),
                                ),
                                Text(
                                  wall.mission,
                                  style: Theme.of(context).textTheme.subhead,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Edit Wall',
            child: Icon(Icons.edit),
            onPressed: wall == null
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AddEditScreen(
                            onSave: (name, mission) {
                              BlocProvider.of<WallsBloc>(context).dispatch(
                                UpdateWall(
                                  wall.copyWith(name: name, mission: mission),
                                ),
                              );
                            },
                            isEditing: true,
                            wall: wall,
                          );
                        },
                      ),
                    );
                  },
          ),
        );
      },
    );
  }
}
