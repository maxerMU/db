import psycopg2
from py_linq import Enumerable

con = psycopg2.connect(database="betsdb",
                       user="postgres",
                       password="Pass2020!",
                       host="127.0.0.1",
                       port="5432")

def print_cur(cur):
    rows = cur.fetchall()
    for row in rows:
        for col in row:
            print(col, end=" ")
        print("\n", end="")


def task1():
    cur = con.cursor()

    cur.execute('''
        select department
        from workers
        group by department, id
        having count(*) > 10;
    ''')

    print_cur(cur)
    cur.close()

def task1_linq():
    cur = con.cursor()

    cur.execute('''
        select * from workers;
    ''')

    cust = Enumerable(cur.fetchall())
    cur.close()

    res = (
        cust.group_by(key_names=['department', 'id'], key = lambda x: [x[3], x[0]])
    ).select(
        lambda c: {'department': c.key.department, 'count': c.count()}
    ).where(
        lambda f: f['count'] > 10
    ).to_list()
    print(res)

def task2():
    cur = con.cursor()

    cur.execute('''
        select worker_id, date_
        from accounting
        where type_=2
        group by worker_id, date_
        having min(time_) > '19:00';
    ''')

    print_cur(cur)
    cur.close()

def task2_linq():
    cur = con.cursor()

    cur.execute('''
        select * from accounting;
    ''')

    cust = Enumerable(cur.fetchall())
    cur.close()

    res = (
        cust.where(
            lambda x: x[5] == 2
    ).group_by(key_names=['worker_id', 'date'], key = lambda x: [x[1], x[2]])
    ).select(
        lambda c: {'worker_id': c.key.worker_id, 'date_': c.key.date_, 'min_time': c.min(c.enumerable[4])}
    ).where(
        lambda f: f['min_time'] > '19:00'
    ).to_list()
    print(res)

def task3():
    date = input("Input date: ")
    cur = con.cursor()

    cur.execute(f'''
        select distinct department
        from accounting a join workers w on a.worker_id=w.id
        where type_ = 1 and date_ = '{date}'
        group by worker_id, department
        having min(time_) > '09:00';
    ''')

    print_cur(cur)
    cur.close()

if __name__ == "__main__":
    task1()
    task1_linq()
    task2()
    task3()
    task2_linq()