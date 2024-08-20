import 'package:flutter/material.dart';
import 'package:health_eaze/screens/introduction_pages/sign_up_page/sign_up_page.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController = PageController();
  int currentPageIndex = 0;

   @override
  void initState() {
    super.initState();
    _pageController = PageController();  
  }

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
        buildButton(),
      ],
    ),
   );
 }

 Widget buildPageView(){
  return PageView(
    controller: _pageController,
    onPageChanged: (index){
      setState(() {
        currentPageIndex = index;
      });
    },
    children: getOnboardingPages(),
  );
 }

final String onboardingImage1 = 'images/onboarding_pictures/female_doctor_and_male_doctor_standing_together.png';
final String onboardingImage2 = 'images/onboarding_pictures/Blue_pill_packaging.png';
final String onboardingImage3 = 'images/onboarding_pictures/boy_scientist.png';
final String onboardingImage4 = 'images/onboarding_pictures/online_consultation_3d_2_1.png';


 List <Widget> getOnboardingPages(){
  return[
    buildOnboardingPage(
      imagePath: onboardingImage1,
      bigText: 'Talk to a Doctor',
      smallText: 'Get access to doctors at the comfort of your home',
      pageIndex: 0,
    ),
     buildOnboardingPage(
      imagePath: onboardingImage2,
      bigText: 'Access Pharmacies',
      smallText: 'Get pharmacies closer to you',
      pageIndex: 1,
    ),
     buildOnboardingPage(
      imagePath: onboardingImage3,
      bigText: 'Access Laboratories',
      smallText: 'Get access to laboratories ',
      pageIndex: 2,
    ),
    buildOnboardingPage(
      imagePath: onboardingImage4,
      bigText: 'Consult with Ease',
      smallText: 'Consult with patients at your own comfort',
      pageIndex: 3,
    ),
    
  ];
 }

 Widget buildOnboardingPage({
  required String imagePath, 
  required String bigText, 
  required String smallText, 
  required int pageIndex, 
  bool isLastPage = false}){

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildImage(imagePath, pageIndex),
        buildBigText(bigText),
        buildSmallText(smallText),
      ],
    ),
  );
 }
  
  Widget buildImage(String imagePath, int pageIndex){
    double imageHeight;

     if (pageIndex == 0) {
      imageHeight = MediaQuery.of(context).size.height * 0.5;
  } else {
      imageHeight = MediaQuery.of(context).size.height * 0.45; 
  }
     return SizedBox(
    height: imageHeight,
    child: Center(
      child: Image.asset(imagePath, fit: BoxFit.contain),
    ),
  );
  }

  Widget buildBigText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: black,
      ),
      textAlign: TextAlign.center,
    );
  }

   Widget buildSmallText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildSmoothIndicator(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SmoothPageIndicator(
        controller: _pageController,
        count: 4,
        effect: const ExpandingDotsEffect(
          activeDotColor: primaryColorBlue,
          dotColor: Colors.grey,
          dotHeight: 8,
          dotWidth: 6,
          spacing: 8,
          expansionFactor: 4,
        ),
      ),
    );
  }

  Widget buildButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
        if (currentPageIndex ==3){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));

        }else{
          _pageController.animateToPage(
              3, 
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
        }
      },
      style: ElevatedButton.styleFrom(
       backgroundColor: currentPageIndex == 3? primaryColorBlue: primaryColorPink,
        foregroundColor: currentPageIndex ==3? Colors.white: Colors.white,
        minimumSize: const Size(150, 60),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          
        ),
         textStyle: const TextStyle(
          fontSize: 16, 
          fontWeight: FontWeight.bold,
        ),
      ),
        child: Text(currentPageIndex == 3 ? 'Get Started': 'Skip')
      ),
    );
  }

} 


class DummySignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const Center(
        child: Text('Sign Up Page'),
      ),
    );
  }

}



