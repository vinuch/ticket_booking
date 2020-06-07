import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingPage(),
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
                onPressed: () => { Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return OnboardingPage();
                                  }))},
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
              Align(alignment: Alignment.topRight, child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0,),
                child: Text('Forgot Password?', style: TextStyle(color: Color(0xFF9f9fa0), fontWeight: FontWeight.bold)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
