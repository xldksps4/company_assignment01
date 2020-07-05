
--트리거를 생성하면 insert시마다 자동으로 적용된다.
----------트리거 방법-----------
--create [or replace] trigger (생성할 트리거의 이름)		--Q. create or replace? 왜?
--[before|after] insert on (적용할 테이블의 이름) 				-- 테이블A에서 insert문이 실행되기 전에
--[Referencing OLD AS {변경전 값을 참조하는 변수명} NEW AS {변경 후 값을 참조하는 변수명}]
--[for each row]
--[when(condition)]?
--declare
--변수선언
--begin
--select (사용할 시퀀스의 이름).nextval into :new.(시퀀스 넣을 컬럼 명) from dual;	
--end;

---------------------실패한 트리거 생성1 --------------
--테이블 : code_skill / skill_code number / 
--시퀀스 : code_skill_seq

--트리거 생성
--create or replace trigger code_skill_trg
--before insert on code_skill 
--for each row
--begin
--	select code_skill_seq.nextval into :new.skill_code from dual;
--end;
---------------------실패한 트리거 생성 2 (aquerytools 방법) --------------
--drop trigger code_skill_trg;

--create or replace trigger code_skill_trg
--before insert on code_skill 
--referencing new as new for each row 
--begin
--	select code_skill_seq.nextval
--	into :new.skill_code
--	from dual;
--end;
