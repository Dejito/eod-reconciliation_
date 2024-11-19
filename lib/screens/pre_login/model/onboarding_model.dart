class OnBoardingItem {
  final String? title;
  final String image;

  OnBoardingItem({
    this.title,
    required this.image,
  });
}

class OnBoardingItems {
  static List<OnBoardingItem> loadOnboardItem() {
    return <OnBoardingItem>[
      OnBoardingItem(
        title: ",,,profitability made easy",
        image: 'assets/images/eod_logo.png',
      ),
      OnBoardingItem(
        title: "...one transaction at a time",
        image: 'assets/images/eod_logo.png',
      ),
      // OnBoardingItem(
      //   title: S.current.simplifiedDigitalLivenessVerification,
      //   image: AssetResources.onboardingImageThree,
      // ),
      // OnBoardingItem(
      //   title: S.current.simplifiedDigitalLivenessVerification,
      //   image: AssetResources.onboardingImageFour,
      // )
    ];
  }
}
