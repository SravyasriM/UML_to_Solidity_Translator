package org.iitp.translator.utilities.java;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.json.JSONObject;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import static org.iitp.translator.configs.Constants.JAVA_CODE_STATS_CHART_PATH;
import static org.iitp.translator.configs.Constants.JAVA_STATISTICS_FILE_PATH;

public class BarChartPlotter extends JFrame {

    public BarChartPlotter(String chartTitle) {

        super(chartTitle);

        CategoryDataset categoryDataset = createDataset();

        JFreeChart jFreeChart = ChartFactory.createBarChart(
                chartTitle,
                "Java Programs",
                "Quantity",
                categoryDataset,
                PlotOrientation.VERTICAL,
                true, true, false
        );

        // Customizing
        customizeChart(jFreeChart);

        ChartPanel panel = new ChartPanel(jFreeChart);
        setContentPane(panel);

        saveChart(jFreeChart, JAVA_CODE_STATS_CHART_PATH);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            BarChartPlotter barChartPlotter = new BarChartPlotter("Java Programs Statistics");
            barChartPlotter.setAlwaysOnTop(true);
            barChartPlotter.pack();
            barChartPlotter.setSize(640, 480);
            barChartPlotter.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
            barChartPlotter.setVisible(true);
        });
    }

    private void saveChart(JFreeChart jFreeChart, String path) {

        File imageFile = new File(path);
        int width = 1366;
        int height = 768;

        try {
            ChartUtils.saveChartAsPNG(imageFile, jFreeChart, width, height);
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
    }

    private void customizeChart(JFreeChart jFreeChart) {
        jFreeChart.setBackgroundPaint(Color.WHITE);

        final CategoryPlot categoryPlot = jFreeChart.getCategoryPlot();
        categoryPlot.setBackgroundPaint(Color.DARK_GRAY);
        categoryPlot.setDomainGridlinePaint(Color.WHITE);
        categoryPlot.setRangeGridlinePaint(Color.WHITE);

        final NumberAxis rangeAxis = (NumberAxis) categoryPlot.getRangeAxis();
        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());

        final BarRenderer renderer = (BarRenderer) categoryPlot.getRenderer();
        renderer.setDrawBarOutline(false);

        final GradientPaint gp0 = new GradientPaint(0.1f, 0.1f, Color.RED,
                0.1f, 0.1f, Color.LIGHT_GRAY);
        final GradientPaint gp1 = new GradientPaint(0.1f, 0.1f, Color.YELLOW,
                0.1f, 0.1f, Color.LIGHT_GRAY);
        renderer.setSeriesPaint(0, gp0);
        renderer.setSeriesPaint(1, gp1);

        final CategoryAxis domainAxis = categoryPlot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 6.0));
    }

    private CategoryDataset createDataset() {

        JSONObject stats = null;
        try {
            stats = new JSONObject(new String(Files.readAllBytes(Paths.get(JAVA_STATISTICS_FILE_PATH))));
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }

        assert stats != null;

        DefaultCategoryDataset defaultCategoryDataset = new DefaultCategoryDataset();
        String series1 = "Number of classes";
        String series2 = "Number of methods";
        for (Object object : stats.getJSONArray("table")) {

            JSONObject jsonObject = (JSONObject) object;

            String x_val = jsonObject.getString("b) Java program");
            long y_val1 = jsonObject.getLong("c) Number of classes");
            long y_val2 = jsonObject.getLong("d) Number of methods");

            defaultCategoryDataset.addValue(y_val1, series1, x_val);
            defaultCategoryDataset.addValue(y_val2, series2, x_val);
        }

        return defaultCategoryDataset;
    }
}
