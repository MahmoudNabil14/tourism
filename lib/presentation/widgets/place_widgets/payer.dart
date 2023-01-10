import 'package:flutter/material.dart';
import 'package:tourism/presentation/router/app_router.dart';

class Payer extends StatelessWidget {
  const Payer({Key? key, required this.offers, required this.tripName}) : super(key: key);
  final Map<dynamic,dynamic> offers ;
  final String tripName;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
Navigator.pushNamed(context, Routes.payerDetails,arguments: {
      'myoffer': offers ,
       'tripName' : tripName

});

    },
      child: PhysicalModel(elevation: 5,color: Colors.grey[300]!,borderRadius: BorderRadius.circular(20),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
           height: MediaQuery.of(context).size.height/9,
           padding: EdgeInsets.only(right: 5),

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,
              border: Border.all( color: Colors.grey[300]!,width: 1)
          ),
          child: Row(
            children: [
               Expanded(flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image(
                      height: double.infinity,
                      image: NetworkImage(

                  offers['image']!),
                      width: 100,fit: BoxFit.fill),
                ),
              ),
              const SizedBox(width: 10,
              ),
              Expanded(flex: 2,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(offers['name']!,
                      style: const TextStyle(fontSize: 23, fontWeight: FontWeight
                          .w800),),
                    Text(offers['address']!,maxLines: 2,overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              const SizedBox(width: 10,
              ),
              Text(offers['price']!,
                style: const TextStyle(color: Colors.amber, fontSize:14,fontWeight: FontWeight.bold),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
