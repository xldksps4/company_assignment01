
--방법1

SELECT st.staff_name "이름", st.staff_gender "성별", cd.department_name "부서명", graduate_day "졸업일"
FROM staff st, code_department cd, code_school c_school, staff_skill s_skill, code_skill c_skill 
WHERE st.department_code = cd.department_code
AND st.school_code = c_school.school_code
AND st.staff_no = s_skill.staff_no
AND s_skill.skill_code = c_skill.skill_code         -- 조인 끝
AND st.staff_name LIKE '%' || '사오' || '%'
AND st.staff_gender = '남'
AND cd.department_name = '하이테크사업부'
AND c_school.school_name = '일반대졸' 
AND c_skill.skill_name = 'PHP'         
AND st.graduate_day <= TO_DATE('1983-12-30','yy-MM-dd')
AND st.graduate_day >= TO_DATE('1983-12-01','yy-MM-dd');


--방법2 가상테이블으로 묶기

SELECT A.staff_NO, A.staff_name "이름", A.staff_gender "성별", A.department_name "부서명", A.graduate_day "졸업일"
FROM  (SELECT st.*, cd.*, c_school.*, s_skill.SKILL_code, c_skill.*
      FROM staff st, code_department cd, code_school c_school, staff_skill s_skill, code_skill c_skill 
      WHERE st.department_code = cd.department_code
      AND st.school_code = c_school.school_code
      AND st.staff_no = s_skill.staff_no
      AND s_skill.skill_code = c_skill.skill_code) A         -- 조인 끝
WHERE  A.staff_name LIKE '%' || '사오' || '%'
AND A.staff_gender = '남'
AND A.department_name = '하이테크사업부'
AND A.school_name = '일반대졸'
--OR A.school_name = '고졸'
AND A.skill_name = 'PHP'         
--OR A.skill_name = 'Java'
AND A.graduate_day <= TO_DATE('1983-12-30','yy-MM-dd')
AND A.graduate_day >= TO_DATE('1983-12-01','yy-MM-dd');


--방법 3 select문  * 사용하지 않고 풀어쓰기(중복 제거) 	◆컬럼순서와 dto 순서 매칭

SELECT A.staff_NO, A.staff_name "이름", A.staff_gender "성별", A.department_name "부서명", A.graduate_day "졸업일"
FROM  (SELECT st.*, cd.department_name, c_school.school_name, s_skill.staff_skill_no, c_skill.skill_code, c_skill.skill_name --즁복 제거
      FROM staff st, code_department cd, code_school c_school, staff_skill s_skill, code_skill c_skill 
      WHERE st.department_code = cd.department_code
      AND st.school_code = c_school.school_code
      AND st.staff_no = s_skill.staff_no
      AND s_skill.skill_code = c_skill.skill_code) A         -- 조인 끝
WHERE  A.staff_name LIKE '%' || '사오' || '%'
AND A.staff_gender = '남'
AND A.department_name = '하이테크사업부'
AND A.school_name = '일반대졸'
AND A.skill_name = 'PHP'         
--OR A.skill_name = 'Java'
AND A.graduate_day <= TO_DATE('1983-12-30','yy-MM-dd')
AND A.graduate_day >= TO_DATE('1983-12-01','yy-MM-dd');
 
  


SELECT count(*)
FROM  (SELECT st.*, cd.department_name, c_school.school_name, s_skill.staff_skill_no, c_skill.skill_code, c_skill.skill_name --즁복 제거
      FROM staff st, code_department cd, code_school c_school, staff_skill s_skill, code_skill c_skill 
      WHERE st.department_code = cd.department_code
      AND st.school_code = c_school.school_code
      AND st.staff_no = s_skill.staff_no
      AND s_skill.skill_code = c_skill.skill_code) A         -- 조인 끝
WHERE  A.staff_name LIKE '%' || '사오' || '%'
AND A.staff_gender = '남'
AND A.department_name = '하이테크사업부'
AND A.school_name = '일반대졸'
AND A.skill_name = 'PHP'         
--OR A.skill_name = 'Java'
AND A.graduate_day <= TO_DATE('1983-12-30','yy-MM-dd')
AND A.graduate_day >= TO_DATE('1983-12-01','yy-MM-dd');



--방법 4 아우터조인(?)사용해서 중복 없이 조인




