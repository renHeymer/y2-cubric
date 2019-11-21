import os.path
import MySQLdb

def pywalker(path):
    print(path)
    conn = MySQLdb.connect('localhost', user='root', password='comsc', db='cm6211_1819_team_5')
    cur = conn.cursor()
    for root, dirs, files in os.walk(path):
        for file_ in files:
            print( os.path.join(file_) )
            sql = "insert into scans (scan_id) VALUES('%s')" % \
            (file_)
            cur.execute(sql)
    conn.commit()
    conn.close()

if __name__ == '__main__':
    pywalker('C:/Users/laure/Documents/uni-work/year-2/spring-boot/assessments/client_project/src/main/resources/static/images/Swipe_R_jpgs/Jpgs_V1')
