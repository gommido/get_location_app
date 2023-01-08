import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_location_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String? city;

  @override
  void initState() {
    GetLocationCubit.get(context).getCountry();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('location'),
      ),
      body: BlocConsumer<GetLocationCubit, GetLocationState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return BlocBuilder<GetLocationCubit,GetLocationState>(
              builder: (context, state){
                var cubit = GetLocationCubit.get(context);
                if(state is LocationSuccess){
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size:100,
                          color: Colors.redAccent,),
                         SizedBox(height: MediaQuery.of(context).size.height / 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text('Latitude: '),
                            Text('${cubit.position.latitude}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text('Longitude: '),
                            Text('${cubit.position.longitude}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text('Country: '),
                            Text('${cubit.place.country}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text('ISO Code: '),
                            Text('${cubit.place.isoCountryCode}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text('Governorate: '),
                            Text('${cubit.place.administrativeArea}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text('City: '),
                            Text('${cubit.place.locality}'),
                          ],
                        ),
                      ],
                    ),
                  );

                }
                else if(state is LocationFail){
                  return const Center(child: Text('Fail'));
                }
                else{
                  return const Center(child: CircularProgressIndicator());
                }
              }
          );
        },
      ),
    );
  }
}
