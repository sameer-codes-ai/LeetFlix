import uuid
import datetime
import pymysql
import pymysql.cursors
import os
from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
from flask_cors import CORS

# --- App Initialization ---
app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# --- Configuration ---
app.secret_key = os.getenv('SECRET_KEY', 'your_very_secret_key')

# Database config
DB_HOST = os.getenv('DB_HOST', 'localhost')
DB_USER = os.getenv('DB_USER', 'root')
DB_PASSWORD = os.getenv('DB_PASSWORD', '')
DB_NAME = os.getenv('DB_NAME', 'leetflix')

# SQLAlchemy Configuration
app.config['SQLALCHEMY_DATABASE_URI'] = (
    os.getenv('SQLALCHEMY_DATABASE_URI')
    or f'mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}'
)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config.setdefault('SQLALCHEMY_ENGINE_OPTIONS', {})
app.config['SQLALCHEMY_ENGINE_OPTIONS'].setdefault('pool_pre_ping', True)

db = SQLAlchemy(app)


# --- Database Models (SQLAlchemy ORM) ---
class Users(db.Model):
    __tablename__ = 'users'
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(255), nullable=False)
    results = db.relationship('QuizResult', backref='user', lazy=True)


class QuizResult(db.Model):
    __tablename__ = 'quiz_results'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.sno'), nullable=False)
    show_name = db.Column(db.String(100), nullable=False)
    season = db.Column(db.Integer, nullable=False)
    score = db.Column(db.Integer, nullable=False)
    total_questions = db.Column(db.Integer, nullable=False)
    date_taken = db.Column(db.DateTime, default=datetime.datetime.utcnow)


class Question(db.Model):
    __tablename__ = 'questions'
    question_id = db.Column(db.Integer, primary_key=True)
    qno = db.Column(db.Integer, nullable=True)
    text = db.Column(db.String(500), nullable=False)
    show_name = db.Column(db.String(255), nullable=False)
    season = db.Column(db.Integer, nullable=False)
    options = db.relationship('Option', backref='question', lazy=True)


class Option(db.Model):
    __tablename__ = 'options'
    option_id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('questions.question_id'), nullable=False)
    text = db.Column(db.String(255), nullable=False)
    is_correct = db.Column(db.Boolean, default=False)


class Login(db.Model):
    __tablename__ = 'login'
    sno = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(50), nullable=False)
    dateTime = db.Column(db.DateTime, nullable=False, default=datetime.datetime.utcnow)


# --- Raw DB Connection for Forum API ---
def get_db_connection():
    """Establishes and returns a PyMySQL connection with DictCursor."""
    try:
        conn = pymysql.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME,
            cursorclass=pymysql.cursors.DictCursor,
            autocommit=False
        )
        return conn
    except Exception as e:
        print(f"Database connection failed: {e}", flush=True)
        return None


# --- Main App Routes ---
@app.route("/")
def home():
    return render_template('trivia.html')


@app.route("/forum")
def forum_page():
    if 'user_id' not in session:
        user_info = {"id": None, "name": "Guest", "is_admin": False}
    else:
        user_info = {
            "id": session['user_id'],
            "name": session.get('user_name', 'Unknown User'),
            "is_admin": session.get('is_admin', False)
        }
    return render_template('forum.html', user_info=user_info)


# --- Authentication Routes ---
@app.route("/login", methods=['GET', 'POST'])
def login_page():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        user = Users.query.filter_by(email=email).first()
        if user and check_password_hash(user.password, password):
            session['user_id'] = user.sno
            session['user_name'] = user.name
            session['is_admin'] = email.endswith('@admin.leetflix.com')
            flash("Login successful!", "success")
            return redirect(url_for('home'))
        else:
            flash("Invalid email or password!", "danger")
    return render_template('login.html')


@app.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out.", "info")
    return redirect(url_for('home'))


@app.route("/register", methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        password = request.form.get('password')
        if Users.query.filter_by(email=email).first():
            flash("An account with this email already exists.", "warning")
            return redirect(url_for('register'))
        hashed_pw = generate_password_hash(password, method='pbkdf2:sha256')
        new_user = Users(name=name, email=email, password=hashed_pw)
        db.session.add(new_user)
        db.session.commit()
        flash("Registration successful! Please log in.", "success")
        return redirect(url_for('login_page'))
    return render_template('register.html')


# --- Quiz Routes ---
@app.route("/seasons/<show_name>")
def seasons_page(show_name):
    return render_template('seasons.html', show_name=show_name)


@app.route("/quiz", methods=["GET", "POST"])
def quiz():
    if request.method == "GET":
        show_name = request.args.get('show_name')
        season = request.args.get('season', type=int)
        if show_name and season:
            questions = Question.query.filter_by(show_name=show_name, season=season).all()
            if not questions:
                flash(f"No questions found for {show_name} Season {season}.", "warning")
                return redirect(url_for("home"))
            session['question_ids'] = [q.question_id for q in questions]
            session['q_index'] = 0
            session['score'] = 0
            session['show_name'] = show_name
            session['season'] = season
            session['total_questions'] = len(questions)
        else:
            return redirect(url_for("home"))

    if 'q_index' not in session or 'question_ids' not in session:
        flash("Please select a quiz to start.", "warning")
        return redirect(url_for("home"))

    if request.method == "POST":
        selected_option_id = request.form.get("option")
        if selected_option_id:
            option = Option.query.get(int(selected_option_id))
            if option and option.is_correct:
                session['score'] += 1
        session['q_index'] += 1

    q_index = session.get('q_index', 0)
    total_questions = session.get('total_questions', 0)
    if q_index >= total_questions:
        return redirect(url_for("quiz_result"))

    current_question_id = session['question_ids'][q_index]
    question = Question.query.get(current_question_id)
    return render_template("quiz.html", question=question, current_q_num=q_index + 1, total_questions=total_questions)


@app.route("/quiz_result")
def quiz_result():
    score = session.get('score', 0)
    total = session.get('total_questions', 0)
    if 'user_id' in session:
        new_result = QuizResult(
            user_id=session['user_id'],
            show_name=session.get('show_name'),
            season=session.get('season'),
            score=score,
            total_questions=total
        )
        db.session.add(new_result)
        db.session.commit()

    for key in ['question_ids', 'q_index', 'score', 'show_name', 'season', 'total_questions']:
        session.pop(key, None)

    return render_template("result.html", score=score, total=total)


@app.route("/profile")
def profile_page():
    if 'user_id' not in session:
        flash("Please log in to view your profile.", "warning")
        return redirect(url_for('login_page'))
    user_id = session['user_id']
    results = QuizResult.query.filter_by(user_id=user_id).order_by(QuizResult.date_taken.desc()).all()
    return render_template("profile.html", results=results)


@app.route("/leaderboard")
def leaderboard():
    scores = db.session.query(QuizResult, Users.name).join(Users, QuizResult.user_id == Users.sno).order_by(
        QuizResult.score.desc()
    ).all()
    return render_template('leaderboard.html', scores=scores)


# --- Forum API ---
@app.route('/posts/<string:series_name>', methods=['GET'])
def get_posts(series_name):
    connection = get_db_connection()
    if connection is None:
        return jsonify({'error': 'Could not connect to database.'}), 500

    posts_data = []
    try:
        cursor = connection.cursor()

        sql = """
            SELECT p.id, p.series, p.title, p.content, p.author_id, u.name as author_name, p.timestamp
            FROM posts p
            JOIN users u ON p.author_id = u.sno
            WHERE p.series = %s
            ORDER BY p.timestamp DESC;
        """
        cursor.execute(sql, (series_name,))
        posts_results = cursor.fetchall()

        for post in posts_results:
            comment_sql = """
                SELECT c.id, c.content, c.author_id, u.name as author_name, c.timestamp
                FROM comments c
                JOIN users u ON c.author_id = u.sno
                WHERE c.post_id = %s
                ORDER BY c.timestamp ASC;
            """
            cursor.execute(comment_sql, (post['id'],))
            comments = cursor.fetchall()
            post['comments'] = comments

            vote_sql = "SELECT user_id, vote_type FROM votes WHERE post_id = %s;"
            cursor.execute(vote_sql, (post['id'],))
            vote_results = cursor.fetchall()

            post['upvotes'] = [v['user_id'] for v in vote_results if v['vote_type'] == 'upvote']
            post['downvotes'] = [v['user_id'] for v in vote_results if v['vote_type'] == 'downvote']
            posts_data.append(post)

        print("Fetched posts:", posts_data, flush=True)
        return jsonify(posts_data)
    except Exception as err:
        return jsonify({'error': f'Database error: {err}'}), 500
    finally:
        if connection:
            cursor.close()
            connection.close()


@app.route('/posts', methods=['POST'])
def create_post():
    if 'user_id' not in session:
        return jsonify({'error': 'Authentication required'}), 401

    data = request.json
    if not all(k in data for k in ['series', 'title', 'content']):
        return jsonify({'error': 'Missing data'}), 400

    connection = get_db_connection()
    if connection is None:
        return jsonify({'error': 'Could not connect to database.'}), 500

    try:
        cursor = connection.cursor()
        new_post_id = str(uuid.uuid4())
        sql = "INSERT INTO posts (id, series, title, content, author_id, timestamp) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (new_post_id, data['series'], data['title'], data['content'], session['user_id'], datetime.datetime.now())
        cursor.execute(sql, values)
        connection.commit()
        return jsonify({'message': 'Post created successfully', 'id': new_post_id}), 201
    except Exception as err:
        return jsonify({'error': f'Database error: {err}'}), 500
    finally:
        if connection:
            cursor.close()
            connection.close()


@app.route('/posts/<string:post_id>', methods=['DELETE'])
def delete_post(post_id):
    if 'user_id' not in session:
        return jsonify({'error': 'Authentication required'}), 401

    user_id = session['user_id']
    is_admin = session.get('is_admin', False)

    connection = get_db_connection()
    if connection is None:
        return jsonify({'error': 'Could not connect to database.'}), 500

    try:
        cursor = connection.cursor()
        cursor.execute("SELECT author_id FROM posts WHERE id = %s", (post_id,))
        post_author = cursor.fetchone()

        if not post_author:
            return jsonify({'error': 'Post not found'}), 404

        if post_author['author_id'] != user_id and not is_admin:
            return jsonify({'error': 'Unauthorized to delete this post'}), 403

        cursor.execute("DELETE FROM posts WHERE id = %s", (post_id,))
        connection.commit()
        return jsonify({'message': 'Post deleted successfully'}), 200
    except Exception as err:
        return jsonify({'error': f'Database error: {err}'}), 500
    finally:
        if connection:
            cursor.close()
            connection.close()


@app.route('/posts/<string:post_id>/vote', methods=['POST'])
def vote_post(post_id):
    if 'user_id' not in session:
        return jsonify({'error': 'Authentication required'}), 401

    user_id = session['user_id']
    vote_type = request.json.get('voteType')
    if vote_type not in ['upvote', 'downvote']:
        return jsonify({'error': 'Invalid vote type'}), 400

    connection = get_db_connection()
    if connection is None:
        return jsonify({'error': 'Could not connect to database.'}), 500

    try:
        cursor = connection.cursor()
        cursor.execute("SELECT vote_type FROM votes WHERE post_id = %s AND user_id = %s", (post_id, user_id))
        existing_vote = cursor.fetchone()

        if existing_vote:
            if existing_vote['vote_type'] == vote_type:  # Unvoting
                cursor.execute("DELETE FROM votes WHERE post_id = %s AND user_id = %s", (post_id, user_id))
            else:  # Changing vote
                cursor.execute(
                    "UPDATE votes SET vote_type = %s WHERE post_id = %s AND user_id = %s",
                    (vote_type, post_id, user_id),
                )
        else:  # New vote
            cursor.execute(
                "INSERT INTO votes (id, post_id, user_id, vote_type) VALUES (%s, %s, %s, %s)",
                (str(uuid.uuid4()), post_id, user_id, vote_type),
            )

        connection.commit()
        return jsonify({'message': 'Vote cast successfully'}), 200
    except Exception as err:
        return jsonify({'error': f'Database error: {err}'}), 500
    finally:
        if connection:
            cursor.close()
            connection.close()


@app.route('/posts/<string:post_id>/comments', methods=['POST'])
def add_comment(post_id):
    if 'user_id' not in session:
        return jsonify({'error': 'Authentication required'}), 401

    data = request.json
    if not data or 'content' not in data:
        return jsonify({'error': 'Missing comment content'}), 400

    connection = get_db_connection()
    if connection is None:
        return jsonify({'error': 'Could not connect to database.'}), 500

    try:
        cursor = connection.cursor()
        new_comment_id = str(uuid.uuid4())
        sql = "INSERT INTO comments (id, post_id, content, author_id, timestamp) VALUES (%s, %s, %s, %s, %s)"
        values = (new_comment_id, post_id, data['content'], session['user_id'], datetime.datetime.now())
        cursor.execute(sql, values)
        connection.commit()
        return jsonify({'message': 'Comment added successfully', 'id': new_comment_id}), 201
    except Exception as err:
        return jsonify({'error': f'Database error: {err}'}), 500
    finally:
        if connection:
            cursor.close()
            connection.close()


@app.route('/posts/<string:post_id>/comments/<string:comment_id>', methods=['DELETE'])
def delete_comment(post_id, comment_id):
    if 'user_id' not in session:
        return jsonify({'error': 'Authentication required'}), 401

    user_id = session['user_id']
    is_admin = session.get('is_admin', False)

    connection = get_db_connection()
    if connection is None:
        return jsonify({'error': 'Could not connect to database.'}), 500

    try:
        cursor = connection.cursor()
        cursor.execute("SELECT author_id FROM comments WHERE id = %s AND post_id = %s", (comment_id, post_id))
        comment_author = cursor.fetchone()

        if not comment_author:
            return jsonify({'error': 'Comment not found'}), 404

        if comment_author['author_id'] != user_id and not is_admin:
            return jsonify({'error': 'Unauthorized to delete this comment'}), 403

        cursor.execute("DELETE FROM comments WHERE id = %s", (comment_id,))
        connection.commit()
        return jsonify({'message': 'Comment deleted successfully'}), 200
    except Exception as err:
        return jsonify({'error': f'Database error: {err}'}), 500
    finally:
        if connection:
            cursor.close()
            connection.close()


# --- Run the App ---
if __name__ == '__main__':
    port = int(os.getenv('PORT', '5000'))
    debug = os.getenv('FLASK_DEBUG', '1') == '1'
    app.run(host='0.0.0.0', port=port, debug=debug)
