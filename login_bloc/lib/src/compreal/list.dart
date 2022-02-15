import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.rating,
    required this.pages,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String rating;
  final int pages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child:InkWell(
          onTap: (){ print("Card Clicked"); },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,      
        children: <Widget>[
        Expanded(
            
            child: thumbnail,
          ),
         Expanded(
            flex: 4,
            child: _BookDescription(
              title: title,
              rating: rating,
              pages: pages,
            ),
          ),
        ],
        
      ),
    ),
    );
  }
}

class _BookDescription extends StatelessWidget {
  const _BookDescription({
    Key? key,
    required this.title,
    required this.rating,
    required this.pages,
  }) : super(key: key);

  final String title;
  final String rating;
  final int pages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Row(children: <Widget>[
            Text(
              rating,
              style: const TextStyle(fontSize: 10.0),
            ),
            const Icon(
              Icons.star,
              size: 16.0,
            ),
          ]),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            'Pages:$pages ',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 150.0,
      children: <CustomListItem>[
        CustomListItem(
          rating: '4.5',
          pages: 200,
          thumbnail: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('index5.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          title: 'Book1',
        ),
        CustomListItem(
          rating: '4.1',
          pages: 523,
          thumbnail: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('index.jpeg'),
                  fit: BoxFit.cover),
            ),
          ),
          title: 'Book2',
        ),
        CustomListItem(
          rating: '4.2',
          pages: 423,
          thumbnail: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('index1.jpeg'),
                  fit: BoxFit.cover),
            ),
          ),
          title: 'Book3',
        ),
        CustomListItem(
          rating: '4.7',
          pages: 230,
          thumbnail: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('index2.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          title: 'Book4',
        ),
         CustomListItem(
          rating: '4.2',
          pages: 230,
          thumbnail: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('index2.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          title: 'Book6',
        ),
        CustomListItem(
          rating: '3.8',
          pages: 142,
          thumbnail: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('index3.jpeg'),
                  fit: BoxFit.cover),
            ),
          ),
          title: 'Book5',
        ),
      ],
    );
  }
}
