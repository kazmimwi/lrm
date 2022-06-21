import 'package:flutter/material.dart';
import 'package:landareacalculator/conststring/texts.dart';
class appbarwid extends StatelessWidget {
  appbarwid(
      {required this.tkanal, required this.tmarla, required this.tsqfoot});
  int tkanal, tmarla, tsqfoot;


  @override
  Widget build(BuildContext context) {
    int sumraqbasqfoot, sumkanala, summarla, sumsqfoot;

    tkanal = tkanal*20*272;
    tmarla = tmarla *272;
    sumraqbasqfoot = tkanal + tmarla + tsqfoot;
    double dblkanal = sumraqbasqfoot/20/272;
    sumkanala = dblkanal.toInt();

    double dblmarla =((dblkanal- sumkanala)*20);
    summarla = dblmarla.toInt();
    print(" ${((dblmarla- summarla)).toInt()} ");
    sumsqfoot = ((dblmarla- summarla)*272).toInt();

    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Expanded(
          //   // result titles lables
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Expanded(
          //           child: Container(
          //               margin: EdgeInsets.symmetric(horizontal: 5.0),
          //               decoration: BoxDecoration(
          //                 border: Border.all(
          //                   color: Colors.black,
          //                 ),
          //               ),
          //               child: Text(
          //                 texts.kanal,
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(fontSize: 15),
          //                 softWrap: false,
          //                 overflow: TextOverflow.ellipsis,
          //               ))),
          //       Expanded(
          //           child: Container(
          //               margin: EdgeInsets.symmetric(horizontal: 5.0),
          //               decoration: BoxDecoration(
          //                 border: Border.all(
          //                   color: Colors.black,
          //                 ),
          //               ),
          //               child: Text(
          //                 texts.marla,
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(fontSize: 15),
          //                 softWrap: false,
          //                 overflow: TextOverflow.ellipsis,
          //               ))),
          //       Expanded(
          //           child: Container(
          //               margin: EdgeInsets.symmetric(horizontal: 5.0),
          //               decoration: BoxDecoration(
          //                 border: Border.all(
          //                   color: Colors.black,
          //                 ),
          //               ),
          //               child: Text(
          //                 texts.sqfoot,
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(fontSize: 15),
          //                 softWrap: false,
          //                 overflow: TextOverflow.ellipsis,
          //               ))),
          //     ],
          //   ),
          // ),
          Expanded(
            // result figures
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

      resltmethod(sumkanala),
                resltmethod(summarla),
                resltmethod(sumsqfoot),
              ],
            ),
          ),
        ],
      ),
    );
  }

   resltmethod(int resltvalues) {
    return Stack(
       children: <Widget>[
         Container(
           width: double.infinity,
           height: 200,
           margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
           padding: EdgeInsets.only(bottom: 10),
           decoration: BoxDecoration(
             border: Border.all(
                 color: Color.fromARGB(255, 51, 204, 255), width: 1),
             borderRadius: BorderRadius.circular(5),
             shape: BoxShape.rectangle,
           ),
         ),
         Positioned(
             left: 50,
             top: 12,
             child: Container(
               padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
               color: Colors.white,
               child: Text(
                 'Create an account',
                 style: TextStyle(color: Colors.black, fontSize: 12),
               ),
             )),
       ],
     )
     )

      // child: FittedBox(
      //   child: Center(
      //     child: Text(
      //       "$resltvalues",
      //       style: TextStyle(fontSize: 58),
      //       softWrap: false,
      //       overflow: TextOverflow.ellipsis,
      //     ),
      //   ),
      // ),
    );
  }
}
