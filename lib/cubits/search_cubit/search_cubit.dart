import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test5/Classes/Post.dart';
import 'package:test5/Services/getdata.dart';
import 'package:test5/cubits/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(InitialState());

  searchfun(String str) async {
    List searchedPosts = [];
    List<Postt> mylist = await GetData(dio: Dio()).GetNews("general");
    for (var post in mylist) {
      if (post.str1.contains(str)) {
        searchedPosts.add(post);
      }
    }
    if (searchedPosts.isEmpty) {
      emit(FailedSearchState());
    } else {
      emit(SuccessSearchState());
    }
  }
}



/* 

Block pattern as a state managment:
1- create states (dont forget extends)
2- create cubit (extends cubit)
3- create function  (put the logic who cause the cubit in it )
4- Provide cubit (i will ask my self where should i do the blocProvider by see the tree)
5- integrate cubit (in the place who will take all states conditions, do the blocBuilder and some if statments)
6- trigger cubit (in the place which case the action, do an object of cubit by blocprovider and call the cubit function)

*/




/* some exceptions and solution

Exception has occurred.
FlutterError (        BlocProvider.of() called with a context that does not contain a WeatherCubit.
        No ancestor could be found starting from the context that was passed to BlocProvider.of<WeatherCubit>()
        

the problem is that the context is inistialized 
before the create of the cubit .

the solution is to make the widget below the create cubit (wrap with builder)
like this example Builder(
Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<WeatherCubit, WeatherStates>(
                  builder: (context, state) {
                var weatherVar =
                    BlocProvider.of<WeatherCubit>(context).weatherVar;

                return MaterialApp(
                  theme: ThemeData(






Exception has occurred.
LateError (LateInitializationError: Field 'weatherVar' has not been initialized.)


remove late and make it null and deal with cases
        */



/*

MaterialColor getColor(String? status) {
  if (status == null) {
    return Colors.blue; // Default color when no weather is available
  } else if (status == "Sunny") {
    return Colors.orange; // Sunny weather color
  } else if (status == "Partly cloudy") {
    return Colors.blueGrey; // Partly cloudy weather color
  } else if (status == "Blizzard" ||
      status == "Freezing fog" ||
      status.contains("shower") ||
      status.contains("freezing") ||
      status == "Light drizzle" ||
      status.contains("drizzle") ||
      status.contains("thunder") ||
      status.contains("sleet") ||
      status == "Cloudy" ||
      status == "Overcast" ||
      status == "Fog" ||
      status == "Mist" ||
      status.contains("rain") ||
      status.contains("snow")) {
    // Use the icy blue snowy color for these conditions
    return MaterialColor(0xFFE0F7FA, {
      50: Color.fromRGBO(224, 247, 250, .1),
      100: Color.fromRGBO(224, 247, 250, .2),
      200: Color.fromRGBO(224, 247, 250, .3),
      300: Color.fromRGBO(224, 247, 250, .4),
      400: Color.fromRGBO(224, 247, 250, .5),
      500: Color.fromRGBO(224, 247, 250, .6), // Main snowy color
      600: Color.fromRGBO(224, 247, 250, .7),
      700: Color.fromRGBO(224, 247, 250, .8),
      800: Color.fromRGBO(224, 247, 250, .9),
      900: Color.fromRGBO(224, 247, 250, 1),
    });
  } else {
    return Colors.blue; // Default fallback color
  }
}


*/
