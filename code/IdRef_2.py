import psycopg2
import psycopg2.extras
import os.path

class Database():
    """PostgreSQL Database class"""

    def __init__(self, _host='localhost', _db='Clusters', _user='postgres', _pwd='31415') :       
    # connect to the database
        self.conn = psycopg2.connect(
                        host=_host,
                        database=_db,
                        user=_user,
                        password=_pwd)
        self.conn.autocommit = True
        self.cursor = self.conn.cursor(cursor_factory = psycopg2.extras.RealDictCursor)

    def create(self, AG) :           
    # to create a table that stores the information from the ambiguous group AG
        query = '''CREATE TABLE IF NOT EXISTS '''+ AG + ''' (name TEXT,\
            idrefs TEXT[]);'''

        self.cursor.execute(query)
    
    def copyCSV(self, fileCSV, AG) :       
    # to convert the data in fileCSV to the table AG
        with open(fileCSV, 'r') as f :
            next(f)     # skip the header row
            self.cursor.copy_from(f, AG, sep='|')

    def createIndex(self, AG) :        
    # to create GIN index for the column 'idrefs' to speed up search
        query = "CREATE INDEX idrefs_search ON " + AG + " USING GIN(idrefs)"
        self.cursor.execute(query)

    def addIdentifier(self, AG) :          
    # to add new columns to execute the processus idref_2
        query = '''ALTER TABLE ''' + AG + '''\
            ADD COLUMN NewIdRef BOOL DEFAULT FALSE,\
            ADD COLUMN MissIdRef BOOL DEFAULT FALSE,\
            ADD COLUMN SplitIdRef BOOL DEFAULT FALSE,\
            ADD COLUMN MergeIdRef BOOL DEFAULT FALSE;'''
        self.cursor.execute(query)

    def updateNew(self, AG) :       
    # to update the column 'newidref' if corresponding records don't have any idref
        query = 'UPDATE ' + AG + " SET newidref = True \
            WHERE idrefs = ARRAY['''empty'''];"
        self.cursor.execute(query)
    
    def updateMiss(self, AG) :
    # to update the column 'missidref' if corresponding records have a idref 'empty'
        query = 'UPDATE ' + AG + " SET missidref = True\
            WHERE newidref = False AND idrefs @> ARRAY['''empty'''];"
        self.cursor.execute(query)

    def updateSplit(self, AG) :
    # to update the column 'splitidref' if corresponding records have more than 1 nonempty idref
        query = 'UPDATE ' + AG + ''' SET splitidref = True\
            WHERE CASE \
                WHEN missidref = True THEN\
                    3 <= array_length(idrefs, 1) 
                ELSE 
                    2 <= array_length(idrefs, 1)
            END;'''
        self.cursor.execute(query)

    def updateMerge(self, AG) :
    # to update the column 'mergeidref' if corresponding records have the same idref of another record
        query = "CREATE OR REPLACE FUNCTION nb_duplicated(TEXT[]) RETURNS integer AS $$\
                    SELECT\
                        SUM(CASE\
                            WHEN idrefs <> ARRAY['''empty'''] AND $1 @> ARRAY[idrefs] THEN 1\
                            ELSE 0\
                        END)\
                    FROM " + AG +", unnest(idrefs)\
                $$ LANGUAGE sql;"
        self.cursor.execute(query)      # we create a function in postgres who count the occurrences of idrefs
        self.conn.commit()
        query = "UPDATE " + AG + ''' SET mergeidref = True\
            WHERE nb_duplicated(idrefs) >= 2;'''
        self.cursor.execute(query)
        query = "DROP FUNCTION nb_duplicated;"
        self.cursor.execute(query)

    def query(self, query) :
        self.cursor.execute(query)
    
    def close(self) :
        self.cursor.close()
        self.conn.close()

db = Database()
info_input = 'C:/Users/liu/Documents/GitHub/test/data/dbInfo_csv'      # the directory 
for AG in os.listdir(info_input):
    AG = AG.split('.')[0]
    db.create(AG)
    db.copyCSV(info_input + '/' + AG + '.csv', AG)
    db.addIdentifier(AG)
    db.updateNew(AG)
    db.updateMiss(AG)
    db.updateSplit(AG)
    db.updateMerge(AG)
db.close()