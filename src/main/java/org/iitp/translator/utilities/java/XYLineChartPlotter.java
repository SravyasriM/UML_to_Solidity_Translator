package org.iitp.translator.utilities.java;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.json.JSONObject;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import static org.iitp.translator.configs.Constants.*;

public class XYLineChartPlotter extends JFrame {

    public XYLineChartPlotter(String chartTitle) {

        super(chartTitle);

        XYDataset xyDataset;

        String title, yLabel, path;
        if (chartTitle.equals("Statistics-Time")) {
            title = "LOC vs Time";
            yLabel = "Time (seconds)";
            xyDataset = createDataSetForTime();
            path = LOC_VS_TIME_CHART_PATH;
        } else {
            title = "LOC vs Memory";
            yLabel = "Memory (MB)";
            xyDataset = createDataSetForMemory();
            path = LOC_VS_MEMORY_CHART_PATH;
        }

        JFreeChart jFreeChart = ChartFactory.createXYLineChart(
                title,
                "Lines of Code (LOC)",
                yLabel,
                xyDataset,
                PlotOrientation.VERTICAL,
                true, true, false
        );

        // Customizing
        customizeChart(jFreeChart);

        ChartPanel panel = new ChartPanel(jFreeChart);
        setContentPane(panel);

        saveChart(jFreeChart, path);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            XYLineChartPlotter xyLineChartPlotter = new XYLineChartPlotter("Statistics-Time");
            xyLineChartPlotter.setAlwaysOnTop(true);
            xyLineChartPlotter.pack();
            xyLineChartPlotter.setSize(640, 480);
            xyLineChartPlotter.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
            xyLineChartPlotter.setVisible(true);
        });

        SwingUtilities.invokeLater(() -> {
            XYLineChartPlotter xyLineChartPlotter = new XYLineChartPlotter("Statistics-Memory");
            xyLineChartPlotter.setAlwaysOnTop(true);
            xyLineChartPlotter.pack();
            xyLineChartPlotter.setSize(640, 480);
            xyLineChartPlotter.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
            xyLineChartPlotter.setVisible(true);
        });
    }

    private void customizeChart(JFreeChart jFreeChart) {

        XYPlot xyPlot = jFreeChart.getXYPlot();
        XYLineAndShapeRenderer xyLineAndShapeRenderer = new XYLineAndShapeRenderer();
        xyPlot.setRenderer(xyLineAndShapeRenderer);

        // sets paint color for each series
        xyLineAndShapeRenderer.setSeriesPaint(0, Color.RED);
        xyLineAndShapeRenderer.setSeriesPaint(1, Color.GREEN);
        xyLineAndShapeRenderer.setSeriesPaint(2, Color.YELLOW);

        // sets thickness for series (using strokes)
        xyLineAndShapeRenderer.setSeriesStroke(0, new BasicStroke(4.0f));
        xyLineAndShapeRenderer.setSeriesStroke(1, new BasicStroke(3.0f));
        xyLineAndShapeRenderer.setSeriesStroke(2, new BasicStroke(2.0f));

        xyPlot.setRenderer(xyLineAndShapeRenderer);

        xyPlot.setOutlinePaint(Color.BLUE);
        xyPlot.setOutlineStroke(new BasicStroke(2.0f));

        xyPlot.setBackgroundPaint(Color.DARK_GRAY);

        xyPlot.setRangeGridlinesVisible(true);
        xyPlot.setRangeGridlinePaint(Color.BLACK);

        xyPlot.setDomainGridlinesVisible(true);
        xyPlot.setDomainGridlinePaint(Color.BLACK);
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

    private XYSeriesCollection createDataSetForTime() {

        JSONObject stats = null;
        try {
            stats = new JSONObject(new String(Files.readAllBytes(Paths.get(STATISTICS_FILE_PATH))));
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }

        assert stats != null;

        XYSeriesCollection xySeriesCollection = new XYSeriesCollection();
        XYSeries xySeries1 = new XYSeries("Java code parsing time (seconds)");
        XYSeries xySeries2 = new XYSeries("AST to AST translation time (seconds)");
        XYSeries xySeries3 = new XYSeries("AST to Solidity code generation time (seconds)");

        for (Object object : stats.getJSONArray("table")) {

            JSONObject jsonObject = (JSONObject) object;

            long x_val = jsonObject.getLong("b) LOC Java (including comments)");
            double y_val1 = jsonObject.getDouble("d) Java code parsing time (seconds)");
            double y_val2 = jsonObject.getDouble("e) AST to AST translation time (seconds)");
            double y_val3 = jsonObject.getDouble("f) AST to Solidity code generation time (seconds)");

            xySeries1.add(x_val, y_val1);
            xySeries2.add(x_val, y_val2);
            xySeries3.add(x_val, y_val3);
        }

        xySeriesCollection.addSeries(xySeries1);
        xySeriesCollection.addSeries(xySeries2);
        xySeriesCollection.addSeries(xySeries3);

        return xySeriesCollection;
    }

    private XYSeriesCollection createDataSetForMemory() {

        JSONObject stats = null;
        try {
            stats = new JSONObject(new String(Files.readAllBytes(Paths.get(STATISTICS_FILE_PATH))));
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }

        assert stats != null;

        XYSeriesCollection xySeriesCollection = new XYSeriesCollection();
        XYSeries xySeries4 = new XYSeries("Memory Usage (MB)");

        for (Object object : stats.getJSONArray("table")) {

            JSONObject jsonObject = (JSONObject) object;

            long x_val = jsonObject.getLong("b) LOC Java (including comments)");
            double y_val4 = jsonObject.getDouble("g) Memory usage (MB)");

            xySeries4.add(x_val, y_val4);
        }

        xySeriesCollection.addSeries(xySeries4);
        return xySeriesCollection;
    }
}
