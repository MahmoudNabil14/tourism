import 'package:flutter/material.dart';
import 'package:tourism/presentation/router/app_router.dart';

class Payer extends StatelessWidget {
  const Payer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
Navigator.pushNamed(context, Routes.payerDetails);

    },
      child: PhysicalModel(elevation: 5,color: Colors.grey[300]!,borderRadius: BorderRadius.circular(20),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer
          ,
           padding: EdgeInsets.only(right: 5),

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,
              border: Border.all( color: Colors.grey[300]!,width: 1)
          ),
          child: Row(
            children: [
              const Expanded(flex: 1,
                child: Image(image: NetworkImage(
                    'https://img.freepik.com/premium-photo/student-picking-book-from-'
                        'shelf-library_13339-106557.jpg?w=1380'),
                    width: 100,fit: BoxFit.fill),
              ),
              const SizedBox(width: 10,
              ),
              Expanded(flex: 2,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Dahab Travel',
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight
                          .w800),),
                    Text('234 Tereet el gabal st , Zaitoun , Cairo ',maxLines: 2,overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              const SizedBox(width: 10,
              ),
              Text('5000\$',
                style: TextStyle(color: Colors.amber, fontSize:14,fontWeight: FontWeight.bold),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
