import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _numberOfPages = 3;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numberOfPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 2.5),
      height: 8.0,
      width: isActive ? 44.0 : 16.0,
      decoration: BoxDecoration(
          color: isActive ? Color(0xFF367ffa) : Color(0xFF9abffc),
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 30.0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _currentPage != 0
                          ? FlatButton(
                              onPressed: () {
                                // setState(() {
                                //   _currentPage--;
                                // });
                                _pageController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back,
                                    color: Color(0xFF367ffa),
                                  ),
                                  Text(
                                    '',
                                    style: TextStyle(
                                        color: Color(0xFF367ffa),
                                        fontSize: 16.0),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  )
                                ],
                              ),
                            )
                          : Text(''),
                      Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          onPressed: () => print('Skip'),
                          child: Text(
                            'SKIP',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 560.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/OnboardingIllustration_1.png',
                              height: 400.0,
                              width: 400.0,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: _buildPageIndicator()),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Find Turnups',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Gilroy'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Recusandae ab nostrum nihil maxime similique, laboriosam vitae dicta aperiam, numquam est expedita.',
                              style:
                                  TextStyle(fontSize: 13, fontFamily: 'Gilroy'),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/OnboardingIllustration_2.png',
                              height: 400.0,
                              width: 400.0,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: _buildPageIndicator()),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Get Tickets',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Recusandae ab nostrum nihil maxime similique, laboriosam vitae dicta aperiam, numquam est expedita.',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/OnboardingIllustration_3.png',
                              height: 400.0,
                              width: 400.0,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: _buildPageIndicator()),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Stay Updated',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Recusandae ab nostrum nihil maxime similique, laboriosam vitae dicta aperiam, numquam est expedita.',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _currentPage != _numberOfPages - 1
                        ? FlatButton(
                            onPressed: () {
                              // setState(() {
                              //   _currentPage++;
                              // });
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  height: 100.0,
                                ),
                                Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Color(0xFF367ffa), fontSize: 16.0),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF367ffa),
                                )
                              ],
                            ),
                          )
                        : Text('')
                  ],
                ),
                _currentPage == _numberOfPages - 1
                    ? Row(
                        children: <Widget>[
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0)),
                                onPressed: () => {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0, vertical: 15.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                                color: Color(0xFF367ffa),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              OutlineButton(
                                borderSide:
                                    BorderSide(color: Color(0xFF367ffa)),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0)),
                                onPressed: () => print('Register'),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0, vertical: 15.0),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    : Text(''),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.only(left: 0),
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OnboardingPage();
                  }))
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy'),
                ),
              ),
              Text(
                'Lorem ipsum, dolor sit amet consectetur adipisicing elit',
                style: TextStyle(fontSize: 13.0, fontFamily: 'Gilroy'),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy'),
                ),
              ),
              Container(
                height: 55.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xFFdae1ed),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'type in your username',
                        hintStyle: TextStyle(
                            color: Color(0xFF7f7f7f),
                            fontFamily: 'Gilroy',
                            fontSize: 17)),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy'),
                ),
              ),
              Container(
                height: 55.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xFFdae1ed),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(
                          color: Color(0xFF7f7f7f),
                          fontFamily: 'Gilroy',
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16.0,
                    ),
                    child: Text('Forgot Password?',
                        style: TextStyle(
                            color: Color(0xFF9f9fa0),
                            fontWeight: FontWeight.bold)),
                  )),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)),
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FeedPage();
                      }))
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0, fontFamily: 'Gilroy'),
                      ),
                    ),
                    color: Color(0xFF367ffa),
                  ),
                  FlatButton(
                    color: Color(0xFF367ffa),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)),
                    onPressed: () => print('Register'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: Icon(Icons.fingerprint, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Dont have an Account yet? Sign up',
                  style: TextStyle(fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () { Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }));},
                            icon: Icon(Icons.arrow_back_ios)

                          ),
                          SizedBox(
                            width: 1.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Techie',
                              style: TextStyle(
                                  fontFamily: 'Google Sans',
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                            ),
                          ),
                        ],
                      ),
                    ),

                    FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/Menubar_1.png',
                            width: 30.0,
                          ),
                          Image.asset(
                            'assets/icons/Menubar_2.png',
                            width: 30.0,
                          ),
                          Image.asset(
                            'assets/icons/Menubar_3.png',
                            width: 30.0,
                          ),
                        ],
                      ),
                    )
                    // Column(S)
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonBar(alignment: MainAxisAlignment.start, children: <Widget>[
                PlaceDropdown(),
                DateDropdown(),
              ]),
              EventCard(banner: 'assets/images/banner_1.png',title: 'Dev Conference', venue:'Stirufuel Theater'),
              EventCard(banner: 'assets/images/banner_2.png',title: 'Adobe MAX Conference', venue:'stirufuel theater'),
              EventCard(banner: 'assets/images/banner_3.png',title: 'Codela Hackathon', venue:'Stirufuel Theater'),
              EventCard(banner: 'assets/images/banner_4.png',title: 'Jax Cyberlympics', venue:'Stirufuel Theater'),
              
            ],
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
    final String banner;
    final String title;
    final String venue;
   EventCard({
    Key key,
    this.banner,
    this.title,
    this.venue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget>[
            Image.asset(
              banner,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Gilroy'),
                  ),
                  Text(
                    'Thur, Mar 26, 6:00pm $venue',
                    style: TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: 'Google Sans',
                        fontSize: 17.0),
                  ),
                  new Divider(
                    color: Colors.black,
                  ),
                  ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: <Widget>[
                        
                        SizedBox(
                          width: 50,
                          child: FlatButton(
                            padding:
                                EdgeInsets.symmetric(horizontal: 0),
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/icons/save.png',
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Save',
                                  style: TextStyle(fontSize: 12.0, fontFamily: 'Google Sans',),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: FlatButton(
                            padding:
                                EdgeInsets.symmetric(horizontal: 0),
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/icons/share.png',
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(fontSize: 12.0, fontFamily: 'Google Sans',),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: FlatButton(
                            padding:
                                EdgeInsets.symmetric(horizontal: 0),
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/icons/comment.png',
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Comment',
                                  style: TextStyle(fontSize: 12.0, fontFamily: 'Google Sans',),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceDropdown extends StatefulWidget {
  @override
  _PlaceDropdownState createState() =>
      _PlaceDropdownState(['lagos', 'owerri', 'enugu'], 'lagos', 'Somewhere');
}

class _PlaceDropdownState extends State<PlaceDropdown> {
  List<String> _locations; // Option 2
  String _selectedLocation; // Option 2
  String _hintText; // Option 2

  _PlaceDropdownState(this._locations, this._selectedLocation, this._hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),

      // dropdown below..
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0)),
        color: Color(0xFF86b2fc),
        onPressed: () {},
        child: DropdownButton<String>(
            style: TextStyle(color: Colors.white, fontFamily: 'Google Sans'),
            value: _selectedLocation,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 18.0,
            ),
            iconSize: 42,
            underline: SizedBox(),
            onChanged: (String newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: _locations.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()),
      ),
    );
  }
}

class DateDropdown extends StatefulWidget {
  @override
  _DateDropdownState createState() =>
      _DateDropdownState(['Any date'], 'Any date', 'Somewhere');
}

class _DateDropdownState extends State<DateDropdown> {
  List<String> _locations; // Option 2
  String _selectedLocation; // Option 2
  String _hintText; // Option 2

  _DateDropdownState(this._locations, this._selectedLocation, this._hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),

      // dropdown below..
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0)),
        color: Color(0xFF86b2fc),
        onPressed: () {},
        child: DropdownButton<String>(
            style: TextStyle(color: Colors.white, fontFamily: 'Google Sans'),
            value: _selectedLocation,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 18.0,
            ),
            iconSize: 42,
            underline: SizedBox(),
            onChanged: (String newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: _locations.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()),
      ),
    );
  }
}
