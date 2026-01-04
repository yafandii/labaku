part of '../home_screen.dart';

class SectionBalance extends StatelessWidget {
  final double balance;
  final String title;
  const SectionBalance({
    super.key,
    this.balance = 0,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primaryBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.gold.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(12),
                
              ),
              child: LottieBuilder.asset(
                AppAssets.wallet,
                height: 32,
                repeat: false,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pendapatan $title',
                  style: AppFont.text12Normal
                      .copyWith(color: AppColor.backgroundColor),
                ),
                const SizedBox(height: 4),
                Text(
                  CurrencyFormatter.idr(balance),
                  style: AppFont.text20Bold.copyWith(
                    color: AppColor.backgroundColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
