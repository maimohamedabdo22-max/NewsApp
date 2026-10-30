import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/detalies_screen.dart';
import 'package:newsapp/home/cubit/home_cubit.dart';


class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => HomeCubit()..getSearchData(query: query),
      child: Scaffold(
        backgroundColor: Color(0xffFAF9F9),
        appBar:  AppBar(
          leading: BackButton(),
          title: Text("Search results for $query", style: TextStyle(
fontSize: 18,
fontWeight: FontWeight(600),


          ),),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            ////...handel state

            // loading..................

            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is HomeFailure) {
              return Center(child: Text(state.msg));
            }
            if (state is HomeSucces) {
              return ListView.separated(
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final item = state.data[index];
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
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                item.description ?? "Description",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight(600),
                                ),
                              ),


 SizedBox(height: 6),


                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.auther ?? "auther",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight(400),
                                        color: Color(0xff6D6265)
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item.data ?? "Date",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight(400),
                                        color: Color(0xff6D6265)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                             
                            ],
                          ),
                        ),
                     SizedBox(width: 12),
                    Expanded(
                          child: Image.network(
                            item.image ??
                                "https://th.bing.com/th/id/OIP.Cbepn0SAKri0wBo1AqAoUwHaHa?w=138&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.image, color: Colors.red);
                            },
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
    );
  }
}
