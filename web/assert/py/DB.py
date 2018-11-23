import pymysql

def openconn():
    # 打开数据库连接
    db = pymysql.Connect(
        host='localhost',
        port=3306,
        user='root',
        passwd='123456',
        db='teachon',
        charset='utf8'
    )
   # db.set_charset()
    # 使用cursor()方法获取操作游标
    ##cursor = db.cursor()
    return db
def insertsql(db,title,abcd,rightans,pid=1,type=1):

    cursor = db.cursor()
    # SQL 插入语句
    # sql = "INSERT INTO paper(pname) \
    #        VALUES ('%s')" % \
    #       (paperName)
    sql1 = "INSERT INTO question(title, \
           answer, rightAnswer,type,pid) \
           VALUES ('%s', '%s', '%s', '%d','%d')" % \
          (title,abcd, rightans,type,pid)
    try:
        # 执行sql语句
        cursor.execute(sql1)
        # 执行sql语句
        db.commit()
    except Exception as e:
        print(str(e))
        # 发生错误时回滚
        db.rollback()
def dbclose(db):
        # 关闭数据库连接
        db.close()