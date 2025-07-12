<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="voting.DataCon" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Election Results</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            margin-top: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            justify-content: space-between; /* Space between the chart and the list */
            align-items: center;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
        }

        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .button-container button:hover {
            background-color: #45a049;
        }

        .chart {
            display: none;
            margin: 0 auto;
            text-align: center;
        }

        .chart.active {
            display: block;
        }

        /* Styling for the Doughnut chart */
        .doughnut-chart-container {
            width: 50%;
            text-align: center;
        }

        /* Styling for the Bar chart */
        .bar-chart-container {
            width: 50%;
            text-align: center;
        }

        /* Styling for the Election results list */
        .results-list {
            width: 40%; /* Adjust width to control the size */
            padding-left: 20px;
            font-size: 18px;
            color: #4CAF50; /* Foreground color for the list */
            list-style-type: none;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .results-list li {
            font-size: 18px;
        }

        .results-list span {
            font-weight: bold;
            color: #4CAF50; /* Accent color for vote count */
        }

        .leading-party {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            margin-top: 30px;
        }

        .leading-party h2 {
            color: #4CAF50;
        }

        .leading-party span {
            font-size: 24px;
            font-weight: bold;
            color: #f44336;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: white;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <jsp:include page="Header.jsp"></jsp:include>

    <h1>Election Results</h1>
    <% 
        Connection connection = DataCon.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultset = statement.executeQuery("select * from Party"); 
    %>

    <% 
        int i = 0;
        int[] arr = new int[5];
        while(resultset.next()){
            arr[i] = resultset.getInt(3);
            i++;
        } 
    %>

    <div class="button-container">
        <button id="showBarChart">Show Bar Chart</button>
        <button id="showDoughnutChart">Show Doughnut Chart</button>
    </div>

    <div class="container">
        <!-- Bar chart container -->
        <div class="chart bar-chart-container" id="barChart" style="max-width: 900px; height: 300px;">
            <canvas id="barChartCanvas"></canvas>
        </div>

        <!-- Doughnut chart container -->
        <div class="chart doughnut-chart-container" id="doughnutChart" style="max-width: 500px; height: 400px;">
            <canvas id="doughnutChartCanvas"></canvas>
        </div>

        <!-- Election Results List -->
        <ul class="results-list" id="res">
            <li>BJP : <span><%=arr[0]%></span></li>
            <li>Congress : <span><%=arr[1]%></span></li>
            <li>SAD : <span><%=arr[2]%></span></li>
            <li>AAP : <span><%=arr[3]%></span></li>
            <li>TMC : <span><%=arr[4]%></span></li>
        </ul>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.7/dist/chart.umd.min.js"></script>
    <script>
        const ctxBar = document.getElementById('barChartCanvas');
        const ctxDoughnut = document.getElementById('doughnutChartCanvas');

        const barChart = new Chart(ctxBar, {
            type: 'bar',
            data: {
                labels: ['BJP', 'Congress', 'SAD', 'AAP', 'TMC'],
                datasets: [{
                    label: 'Votes',
                    data: [<%=arr[0]%>, <%=arr[1]%>, <%=arr[2]%>, <%=arr[3]%>, <%=arr[4]%>],
                    borderWidth: 1,
                    backgroundColor: ['rgb(244, 114, 22)', 'rgb(22, 106, 47)', 'rgb(0,0,128)', 'rgb(0, 154, 218)', 'rgb(128, 0, 0)']
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        const doughnutChart = new Chart(ctxDoughnut, {
            type: 'doughnut',
            data: {
                labels: ['BJP', 'Congress', 'SAD', 'AAP', 'TMC'],
                datasets: [{
                    label: 'Votes',
                    data: [<%=arr[0]%>, <%=arr[1]%>, <%=arr[2]%>, <%=arr[3]%>, <%=arr[4]%>],
                    borderWidth: 1,
                    backgroundColor: ['rgb(244, 114, 22)', 'rgb(22, 106, 47)', 'rgb(0,0,128)', 'rgb(0, 154, 218)', 'rgb(128, 0, 0)']
                }]
            },
            options: {}
        });

        // Initially show the bar chart
        document.getElementById('barChart').classList.add('active');
        document.getElementById('doughnutChart').classList.remove('active');

        // Button click events to switch charts
        document.getElementById('showBarChart').addEventListener('click', function() {
            document.getElementById('barChart').classList.add('active');
            document.getElementById('doughnutChart').classList.remove('active');

        });

        document.getElementById('showDoughnutChart').addEventListener('click', function() {
            document.getElementById('doughnutChart').classList.add('active');

            document.getElementById('barChart').classList.remove('active');
        });
    </script>

    <% 
        ResultSet resultset1 = statement.executeQuery("SELECT SUM(vote)FROM party;");
        String party = null;
        int vote = 0;
        while(resultset1.next()) {
          
            vote = resultset1.getInt("SUM(vote)");
        } 
    %>

    <div class="leading-party">
        <h2>Total number of votes :<%=vote%></h2>
    </div>

    <% connection.close();
    DataCon.close();
    %>

    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
