import pandas as pd
import os
from sqlalchemy import create_engine
from dotenv import load_dotenv

load_dotenv()
db_user = os.getenv('DB_USER')
db_password = os.getenv('DB_PASSWORD')
db_host = os.getenv('DB_HOST')
db_docker_host = os.getenv('DB_DOCKER_HOST')
db_port = int(os.getenv('DB_PORT'))
db_name = os.getenv('DB_NAME')
db_schema = os.getenv('DB_SCHEMA')


db_url = f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
engine = create_engine(db_url)


df_acceptance = pd.read_csv("data/Globepay Acceptance Report..csv", delimiter=";")
df_chargeback = pd.read_csv("data/Globepay Chargeback Report ..csv")

df_acceptance.to_sql(name = "src_globepay__acceptance_report", con=engine, schema=db_schema, if_exists='replace', index=False) 
df_chargeback.to_sql(name = "src_globepay__chargeback_report", con=engine, schema=db_schema, if_exists='replace', index=False) 
print("Data successfully written to PostgreSQL!")
