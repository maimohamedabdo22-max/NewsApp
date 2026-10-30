import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/detalies_screen.dart';
import 'package:newsapp/home/cubit/home_cubit.dart';
import 'package:newsapp/wedgits/CirclrIcons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categrios = ["All", "Politic", "Sport", "Education", "Egypt"];
  int curindex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..gethomeData(),
      child: Scaffold(
        backgroundColor: Color(0xffFAF9F9),
        appBar: AppBar(
          leading: CircleIcons(icon: Icons.menu),
          actions: [
            CircleIcons(icon: Icons.search),
            CircleIcons(icon: Icons.notifications),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Home Screen", style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
              SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool isSelected = curindex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          curindex = index;
                        });

                        if (categrios[index] == "All") {
                          context.read<HomeCubit>().gethomeData();
                        }else{
                         context.read<HomeCubit>().getSearchData(query: categrios[index]);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          //...........................color
                          color: isSelected ? Color(0xffFFA500) : Colors.white,
                          border: Border.all(
                            color: isSelected
                                ? Color(0xffFFA500)
                                : Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            categrios[index],
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 12);
                  },
                  itemCount: categrios.length,
                ),
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Text(
                    "News For You",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight(600)),
                  ),
                  Spacer(),
                  Text(
                    "Show more",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight(600),
                      color: Color(0xff2C57F0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeFailure) {
                      return Center(child: Text(state.msg));
                    }
                    if (state is HomeSucces) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetaliesScreen(model: state.data[index]),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    state.data[index].image ??
                                        "https://th.bing.com/th/id/OIP.Cbepn0SAKri0wBo1AqAoUwHaHa?w=138&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.image,
                                        color: Colors.red,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.data[index].auther ?? "auther",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight(600),
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        state.data[index].description ??
                                            "Description",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight(600),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Align(
                                        alignment: AlignmentGeometry.centerEnd,
                                        child: Text(
                                          state.data[index].data ?? "Date",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight(600),
                                            color: Color(0xffD2B0B0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: state.data.length,
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
