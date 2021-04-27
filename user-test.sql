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

--select 컬럼명, 컬럼명, ....... from table명
select * from member;
select * from board;

--update table명 set 컬럼=value, 컬럼2=value.....
update board
    set read_count = 0, created_date=sysdate, updated_date=sysdate;
-- 조건문을 적용하지 않으면 모든 rows에 적용됩니다.


--no가 1인 게시글의 read_count(조회수) 를 1씩 증가 시키는 쿼리문
update board
set read_count = read_count + 1
where no = 1;

--delete from table명 where 조건
--3번 게시글 삭제
delete from board;






