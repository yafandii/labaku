part of '../home_screen.dart';

class SectionSummary extends StatelessWidget {
  const SectionSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => itemSummary(
            label: index == 0 ? "Transaksi" : "Produk Terjual",
            icon: index == 0 ? AppAssets.icTransaction : AppAssets.icProduct,
            qty: index == 0 ? 1029 : 15201),
        itemCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Container itemSummary(
          {required String icon, required String label, required int qty}) =>
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.whiteSmoke.withValues(alpha: .75),
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primaryColor.withValues(alpha: .5),
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                icon,
                height: 24,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: AppFont.text12Normal,
                ),
                Text(
                  NumberFormatter.formatNumber(qty),
                  style: AppFont.text15Bold,
                ),
              ],
            ),
          ],
        ),
      );
}
