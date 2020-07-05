----테이블 및 시퀀스 삭제 ----------------------------------------------------------
drop table code_skill cascade constraint;
drop sequence code_skill_seq;
drop table code_department cascade constraint;
drop sequence code_department_seq;
drop table code_school cascade constraint;
drop sequence code_school_seq;

drop table staff cascade constraint;
drop sequence staff_seq;
drop table staff_skill cascade constraint;
drop sequence staff_skill_seq;

----생성순서 1----------------------------------------------------------
--시작 1, 1씩 증가
create sequence code_skill_seq start with 1 increment by 1;

create table code_skill(
	skill_code		number(3),
	skill_name		varchar2(20) 	not null unique,
--	constraint code_skill_pk primary key (skill_code)
	primary key(skill_code)
);


----생성순서 1----------------------------------------------------------
create sequence code_department_seq start with 1 increment by 1;
--부서번호
create table code_department (
	department_code		number(3),
	department_name		varchar2(30) 	not null unique,
--	constraint code_department_pk primary key (department_code)
	primary key(department_code)
);


----생성순서 1----------------------------------------------------------
create sequence code_school_seq start with 1 increment by 1;
--최종학력
create table code_school(
	school_code 	number(3),
	school_name		varchar2(20) not null unique,
--	constraint code_school_pk primary key (school_code)
	primary key(school_code)
);


----생성순서 2----------------------------------------------------------
create sequence staff_seq start with 1 increment by 1;
--사원테이블, 기준이 될 테이블
create table staff (
	staff_no		number(3),
	staff_name		varchar2(14)	not null,
	staff_gender	varchar2(6),
	jumin_no		varchar2(14)	not null unique,
	school_code		number(3)		not null,
	department_code	number(3)		not null,
	graduate_day	date			not null,
--	constraint staff_pk primary key (staff_no)
	primary key(staff_no),
	foreign key(school_code) 		references code_school(school_code),
	foreign key(department_code)	references code_department(department_code)
);
-- 예제와는 순서를 다르게, 수정도 조금 했다. graduate_day	char(10) jumin_no		char(14)

--alter table staff add constraint fk_staff_school_code foreign key (school_code) references code_school (school_code);

--alter table staff add constraint FK_staff_department_code foreign key (department_code) references code_department (department_code);

----생성순서 3----------------------------------------------------------
create sequence staff_skill_seq start with 1 increment by 1;
--스킬테이블 중복 값 입출력 위한 테이블
create table staff_skill (
	staff_skill_no		number(3),
	staff_no			number(3)		not null,
	skill_code			number(3)		not null,
--	constraint staff_skill_pk primary key (staff_skill_no)
	primary key(staff_skill_no),
	foreign key(staff_no)				references staff(staff_no),
	foreign key(skill_code) 			references code_skill(skill_code)
);

--alter table staff_skill add constraint fk_staff_skill_no foreign key (staff_no) references staff (staff_no);

--alter table staff_skill add constraint fk_skill_code foreign key (skill_code) references code_skill (skill_code);

----생성순서 4----------------------------------------------------------
select * from code_skill;
--code_skill_seq(시퀀스) skill_code(번호)
insert into code_skill(skill_code, skill_name) values(code_skill_seq.nextval, 'Java');
insert into code_skill(skill_code, skill_name) values(code_skill_seq.nextval, 'JSP');
insert into code_skill(skill_code, skill_name) values(code_skill_seq.nextval, 'ASP');
insert into code_skill(skill_code, skill_name) values(code_skill_seq.nextval, 'PHP');
insert into code_skill(skill_code, skill_name) values(code_skill_seq.nextval, 'Delphi');

--code_department_seq(시퀀스) department_code(번호) 
insert into code_department(department_code, department_name) values(code_department_seq.nextval, '컨설팅사업부');
insert into code_department(department_code, department_name) values(code_department_seq.nextval, '하이테크사업부');
insert into code_department(department_code, department_name) values(code_department_seq.nextval, 'SI사업부');
insert into code_department(department_code, department_name) values(code_department_seq.nextval, '반도체사업부');
insert into code_department(department_code, department_name) values(code_department_seq.nextval, '기업부설연구소');
insert into code_department(department_code, department_name) values(code_department_seq.nextval, '전략기획팀');
insert into code_department(department_code, department_name) values(code_department_seq.nextval, '경영지원팀');

--code_school_seq
insert into code_school(school_code,school_name) values(code_school_seq.nextval, '고졸');
insert into code_school(school_code,school_name) values(code_school_seq.nextval, '전문대졸');
insert into code_school(school_code,school_name) values(code_school_seq.nextval, '일반대졸');

--staff
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '저팔계', '남', '941110-1011011', 1,1, TO_DATE('19831225','yy-MM-dd'));
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '사오정', '남', '930612-1022022', 3,2, TO_DATE('19831221','yy-MM-dd'));
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '손오공', '남', '930702-1033033', 2,3, TO_DATE('19831225','yy-MM-dd'));
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '사오정', '남', '931222-1044044', 3,6, TO_DATE('19831221','yy-MM-dd'));
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '저팔계', '남', '930505-1055055', 1,7, TO_DATE('19831225','yy-MM-dd'));

insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '저팔일', '남', '941110-1066066', 1,2, TO_DATE('19831225','yy-MM-dd'));
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '사오이', '남', '930612-1077077', 3,2, TO_DATE('19831221','yy-MM-dd'));
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '손오삼', '남', '930702-1088088', 2,2, TO_DATE('19831225','yy-MM-dd'));
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '사오사', '남', '931222-1099099', 3,2, TO_DATE('19831221','yy-MM-dd'));
insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '저팔오', '남', '930505-1010010', 1,2, TO_DATE('19831225','yy-MM-dd'));

insert into staff(staff_no, staff_name, staff_gender, jumin_no, school_code, department_code, graduate_day) values(staff_seq.nextval, '오공삼', '여', '930303-2033033', 3,3, TO_DATE('19831225','yy-MM-dd'));

-- staff skill
insert into staff_skill(staff_skill_no, staff_no, skill_code) 
values(staff_skill_seq.nextval, 1, 5);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 2, 4);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 3, 3);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 4, 2);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 5, 1);


insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 6, 4);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 7, 5);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 8, 1);


insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 9, 4);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 10, 5);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 11, 1);

-- staff skill 중복 가능
insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 1, 4);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 3, 5);

insert into staff_skill(staff_skill_no, staff_no, skill_code)
values(staff_skill_seq.nextval, 2, 1);

