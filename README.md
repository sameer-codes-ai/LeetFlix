````markdown
# 🚀 LeetFlix - Level Up Your BingeWatching Journey

Welcome to **LeetFlix** – your one-stop platform to track Binge-Watching progress, compete on leaderboards, engage in discussions, and flaunt those green contribution bubbles like a boss. Inspired by LeetCode and Netflix, but cooler 😎

---

## 🌟 Features

- ✅ User Login / Register System  
- ✅ Sleek UI / UX built for Binge-Watchers vibes  
- ✅ Robust Database for user data and activity tracking  
- ✅ Flask-powered backend to handle requests  
- ✅ Dynamic Leaderboard showing top users 🏆  
- ✅ Discussion Forum for users to connect, ask questions, and share ideas 💬

---

## ⚡ Tech Stack

- **Frontend:** HTML | CSS | JavaScript  
- **Backend:** Flask (Python)  
- **Database:** MySQL (Dockerized)

---

## 🚧 What’s Next

- ✨ More gamification features  
- ✨ Profile customization  
- ✨ Github/Leetcode inspired annual contribution heatmap  
- ✨ Challenges & badges  
- ✨ Dark mode  

---

## 🚀 How to Run Locally (Docker Way)

1️⃣ Clone the repo:  
```bash
git clone https://github.com/sameer-codes-ai/LeetFlix
cd leetflix
````

2️⃣ Make sure you have [Docker](https://www.docker.com/get-started) installed.

3️⃣ Spin up everything (app + forum + MySQL):

```bash
docker-compose build --no-cache app
docker-compose up -d db
# wait a little for DB to finish initialization (watch logs)
docker-compose logs -f db
# then start the app
docker-compose up -d app
docker-compose logs -f app
```

4️⃣ Open in browser:

* App → [http://localhost:5000](http://localhost:5000)
* Forum → [http://localhost:5001](http://localhost:5001)

5️⃣ Stop containers when done:

```bash
docker-compose down
```

---

## 🎯 Contribution Bubbles

We track your daily trivia grind and display it in a cool calendar heatmap 💚

---

## 🏆 Leaderboard

Compete with others and get your rank on the global leaderboard!

* Shows top coders based on problems solved or contribution score
* Stay motivated & flex your coding prowess 💪

---

## 💬 Discussion Forum

A place where users unite 💡

* Post feedback, posts, and comments like a pro
* Connect with the BingeWatching community 🔗

---

## 👋 Stay Connected

Made with ❤️ by team CodeForSurvival for Code2Create hackathon - graVITas 2025 @ VIT Vellore
Follow us on GitHub

Sameer Kumar
Aaryan Gupta
Omkar Joshi
Abhinav Reddy

---

🌐 Let’s build the future of next-level Netflix-Trivia blend together 🚀💡

![Docker](https://img.shields.io/badge/Docker-Ready-brightgreen)

```