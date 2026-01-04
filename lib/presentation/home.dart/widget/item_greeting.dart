part of '../home_screen.dart';

class GreetingHeader extends StatelessWidget {
  final String name;

  const GreetingHeader({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppUtils.greeting()},',
                style:
                    AppFont.text13Normal.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  name,
                  style:
                      AppFont.text16Bold.copyWith(color: AppColor.primaryColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          LottieBuilder.asset(
            AppAssets.icNotification,
            height: 24,
            repeat: false,
          ),
        ],
      ),
    );
  }
}
