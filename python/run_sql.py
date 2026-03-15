from snowflake_connection import get_connection
import logging


def run_sql_file(file_path):

    conn = get_connection()
    cursor = conn.cursor()

    with open(file_path, "r") as f:
        sql_script = f.read()

    for statement in sql_script.split(";"):

        statement = statement.strip()

        if not statement:
            continue

        cursor.execute(statement)

        if statement.lower().startswith("select"):

            rows = cursor.fetchall()

            logging.info(f"{file_path} returned {len(rows)} rows")

            for r in rows:
                logging.info(f"Metrics: {r}")

    cursor.close()
    conn.close()