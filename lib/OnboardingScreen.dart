import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(
      children: [
        Expanded(child: buildPageView()),
        buildSmoothIndicator(),
      ],
    ),
   );
 }

 Widget buildPageView(){
  return PageView(
    controller: _pageController,
    children: getOnboardingPages(),
  );
 }

 List <Widget> getOnboardingPages(){
  return[
    buildOnboardingPage(
      imagePath: '',
      text: 'page 1',
    ),
     buildOnboardingPage(
      imagePath: '',
      text: 'page 2',
    ),
     buildOnboardingPage(
      imagePath: '',
      text: 'page 3',
    ),
  ];
 }

 Widget buildOnboardingPage({required String imagePath, required String text}){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildImage(imagePath),
        buildText(text),
      ],
    ),
  );
 }
  
  Widget buildImage(String imagePath){
    return Expanded(child: 
      Center(
        child: Image.asset(imagePath, fit: BoxFit.contain,),
      )
    );
  }

  Widget buildText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildSmoothIndicator(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SmoothPageIndicator(
        controller: _pageController,
        count: 3,
        effect: const ExpandingDotsEffect(
          activeDotColor: Color.fromRGBO(117, 192, 195, 1.0),
          dotColor: Color.fromRGBO(55,59,68, 1.0),
          dotHeight: 8,
          dotWidth: 6,
          spacing: 8,
          expansionFactor: 3,
        ),
      ),);
  }

}
