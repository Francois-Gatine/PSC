import psycopg2

class Database():
    """PostgreSQL Database class"""

    def __init__(self, _host='localhost', _db='Clusters', _user='postgres', _pwd='31415') :       # connect to the database
        self.conn = psycopg2.connect(
                        host=_host,
                        database=_db,
                        user=_user,
                        password=_pwd)
        self.conn.autocommit = True
        self.cursor = self.conn.cursor()

    def create(self, AG) :           # to create a table that stores the information from the ambiguous group AG
        query = '''CREATE TABLE '''+ AG + ''' (cluster_id int PRIMARY KEY,\
        name varchar(20),\
        IdRef1 varchar(30),\
        IdRef2 varchar(30),\
        IdRef3 varchar(30),\
        IdRef4 varchar(30),\
        IdRef5 varchar(30),\
        Remain varchar(60),
        NewAuthor BOOL DEFAULT FALSE,
        MissIdRef BOOL DEFAULT FALSE,
        SplitIdRef BOOL DEFAULT FALSE,
        MergeIdRef BOOL DEFAULT FALSE);'''

        self.cursor.execute(query)
    
    def copyCSV(self, fileCSV, AG) :       # to convert the data in fileCSV to the table AG
        with open(fileCSV, 'r') as f :
            next(f)     # skip the header row
            self.cursor.copy_from(f, AG, sep=',')

    def query(self, query) :
        self.cursor.execute(query)
    
    def close(self) :
        self.cursor.close()
        self.conn.close()

db = Database()
AG = 'ceb'
db.create(AG)
db.copyCSV('../data/Info/' + AG +'.csv', AG)
db.close()