create table member(
    email varchar2(200) PRIMARY KEY,
    password varchar2(200) not null,
    name varchar2(200) not null,
    created_date timestamp not null,
    updated_date timestamp not null
);

insert into board(no, subject, content, writer)
values(5, 'aaa', 'bbbb', 'test@test.com');

insert into member
values('test@test.com', '1234', 'test', sysdate, sysdate);

commit;

--select �÷���, �÷���, ....... from table��
select * from member;
select * from board;

--update table�� set �÷�=value, �÷�2=value.....
update board
    set read_count = 0, created_date=sysdate, updated_date=sysdate;
-- ���ǹ��� �������� ������ ��� rows�� ����˴ϴ�.


--no�� 1�� �Խñ��� read_count(��ȸ��) �� 1�� ���� ��Ű�� ������
update board
set read_count = read_count + 1
where no = 1;

--delete from table�� where ����
--3�� �Խñ� ����
delete from board;






