<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Обратный отсчет до конца рабочего дня</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            color: white;
            text-align: center;
            background: url('2165817_800x600_Naberezhnaja1_MoreDetail-v3_x2_1596x1058.png') no-repeat center center fixed;
            background-size: cover;
        }

        .message, .countdown, .datetime {
            font-size: 4em;
            background: rgba(0, 0, 0, 0.5);
            padding: 40px;
            border-radius: 20px;
            margin-top: 40px;
        }

        .datetime {
            position: absolute;
            bottom: 20px;
            font-size: 4.5em;
        }
    </style>
</head>
<body>
    <div class="message" id="message"></div>
    <div class="countdown" id="countdown"></div>
    <div class="datetime">
        <p id="current-time"></p>
        <p id="current-day"></p>
        <p id="current-date"></p>
    </div>

    <script>
        function updateCountdown() {
            const now = new Date();
            const hours = now.getHours();
            const minutes = now.getMinutes();
            const seconds = now.getSeconds();

            const workStart = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 9, 0, 0);
            const workEnd = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 18, 0, 0);

            if (hours >= 7 && hours < 9) {
                document.getElementById("message").textContent = "Доброго ранку! Гарного дня!";
                document.getElementById("countdown").textContent = "";
            } else if (now >= workStart && now < workEnd) {
                const timeLeft = workEnd - now;
                const h = Math.floor(timeLeft / (1000 * 60 * 60));
                const m = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
                const s = Math.floor((timeLeft % (1000 * 60)) / 1000);
                document.getElementById("message").textContent = "До кінця робочого дня залишилось:";
                document.getElementById("countdown").textContent = `${h} год. ${m} хв. ${s} сек.`;
            } else if (hours >= 18 && hours < 20) {
                document.getElementById("message").textContent = "До побачення!";
                document.getElementById("countdown").textContent = "";
            } else {
                document.getElementById("message").textContent = "";
                document.getElementById("countdown").textContent = "";
            }
        }

        function updateDateTime() {
            const now = new Date();
            const hours = String(now.getHours()).padStart(2, "0");
            const minutes = String(now.getMinutes()).padStart(2, "0");
            const seconds = String(now.getSeconds()).padStart(2, "0");

            const daysOfWeek = ["Неділя", "Понеділок", "Вівторок", "Середа", "Четвер", "П`ятниця", "Субота"];
            const dayOfWeek = daysOfWeek[now.getDay()];
            const day = String(now.getDate()).padStart(2, "0");
            const month = String(now.getMonth() + 1).padStart(2, "0");
            const year = now.getFullYear();

            document.getElementById("current-time").textContent = `${hours}:${minutes}:${seconds}`;
            document.getElementById("current-day").textContent = dayOfWeek;
            document.getElementById("current-date").textContent = `${day}.${month}.${year}`;
        }

        setInterval(() => {
            updateCountdown();
            updateDateTime();
        }, 1000);

        updateCountdown();
        updateDateTime();
    </script>
</body>
</html>
