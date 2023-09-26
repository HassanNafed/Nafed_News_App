//import 'package:firebasecourse/modules/webView/webViewScreen.dart';
import 'package:firebasecourse/modules/webView/webViewScreen.dart';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:hexcolor/hexcolor.dart';
Widget myDivider()=> Column(
  children: [
 Padding(
  padding: EdgeInsets.all(3.0),
  child:Divider(
    height: 5,
    thickness: 0.8,
    color:Colors.white ,
  ) ,
 ),
 Padding(
  padding: EdgeInsets.all(3.0),
  child:Divider(
    height: 5,
    thickness: 0.8,
    color: HexColor('333739'),
  ) ,
 ),

  ],
);






Widget buildArticalItem ( articles, context)=> InkWell(
  onTap: (){
    Navigator.push(context,MaterialPageRoute(
      builder: (context)=> WebViewScreen(articles['url'])),);
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:   Row(
      children: [
      //      CachedNetworkImage(
      //           imageUrl: ' ${article['urlToImage']}',
      //           fit: BoxFit.cover,
      //           placeholder: (BuildContext context, String url) => Container(
      //         width: 120,
      //         height: 120,
      //         color: Colors.purple,
      //       ),
      //  ),
      SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${articles['title']}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text("'${articles['publishedAt']}'",
                style: TextStyle(color:Colors.grey ),),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);