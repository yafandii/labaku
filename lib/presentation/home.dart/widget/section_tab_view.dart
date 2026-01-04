part of '../home_screen.dart';

class SectionTabView extends StatelessWidget {
  final String title;
  const SectionTabView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionBalance(
            title: title,
            balance: 1500000,
          ),
          const SizedBox(height: 16),
          const SectionSummary(),
          Container(
            height: 250,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: AppColor.secondaryColor.withValues(alpha: .3),
                  blurRadius: 4,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Grafik Penjualan${title == "Bulanan" ? " 6 Bulan Terakhir" : title == "Mingguan" ? " 4 Minggu Terakhir" : title == "Harian" ? " 7 Hari Terakhir" : ""}",
                    style: AppFont.text14Bold),
                const SizedBox(height: 20),
                Expanded(
                  child: LineChart(
                    duration: 300.ms,
                    curve: Curves.easeInOutCubic,
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(1, 1500000),
                            const FlSpot(2, 1200000),
                            const FlSpot(3, 750000),
                            const FlSpot(4, 400000),
                            const FlSpot(5, 950000),
                            const FlSpot(6, 1000000),
                          ],
                          aboveBarData: BarAreaData(show: false),
                          isCurved: true,
                          color: AppColor.primaryBlue,
                          barWidth: 2.5,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (p0, p1, p2, p3) {
                              return FlDotCirclePainter(
                                radius: 4,
                                color: AppColor.gold,
                              );
                            },
                          ),
                          shadow: const Shadow(
                              color: AppColor.primaryBlue, blurRadius: 2),
                          curveSmoothness: 0.5,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  AppColor.primaryBlue.withValues(alpha: .1),
                                  AppColor.primaryBlue.withValues(alpha: .6),
                                ]),
                          ),
                        ),
                      ],
                      minX: 1,
                      maxX: 6,
                      minY: 0,
                      maxY: 2000000,
                      gridData: _buildGridLine(),
                      borderData: _buildBorderOutline(),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: _buildBottomTitle(),
                        topTitles: const AxisTitles(),
                        rightTitles: const AxisTitles(),
                        leftTitles: _buildLeftTitle(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AxisTitles _buildBottomTitle() {
    return AxisTitles(
      axisNameSize: 12,
      sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: (value, meta) {
            if (value.toInt() == 0) {
              return const SizedBox();
            }
            return Text(
                DatesFormat.convertDateTime(
                  DateTime(2025, value.toInt(), 1),
                  format: DateFormatType.shortMonthName,
                ),
                style: AppFont.text11Normal);
          }),
    );
  }

  AxisTitles _buildLeftTitle() {
    return AxisTitles(
      sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 52,
          getTitlesWidget: (value, meta) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(CurrencyFormatter.shortIdr(value.toInt()),
                  style: AppFont.text11Normal),
            );
          }),
    );
  }

  FlBorderData _buildBorderOutline() {
    return FlBorderData(
      show: true,
      border: const Border(
        left: BorderSide(
          color: AppColor.secondaryColor,
          width: 1,
        ),
        bottom: BorderSide(
          color: AppColor.secondaryColor,
          width: 1,
        ),
      ),
    );
  }

  FlGridData _buildGridLine() {
    return FlGridData(
      show: true,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: AppColor.grayColor,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return const FlLine(
          color: AppColor.grayColor,
          strokeWidth: 1,
          dashArray: [5, 5],
        );
      },
    );
  }
}
