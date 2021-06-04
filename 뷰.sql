/*
    # 뷰 (view)
    
     - 물리적인 기본 테이블들을 이용해 생성한 논리적인 가상의 테이블
     - 기본 테이블에서 파생된 BD 객체
     - 뷰를 통해 사용자가 기본 테이블을 제한적으로 사용하게끔 할 수 있다
     
     CREATE [OR REPLACE] VIEW 뷰이름 AS 서브쿼리 [WITH CHECK OPTON | WITH READ ONLY];
     
      - CREATE OR REPLACE : 이미 존재하는 뷰라면 수정을 한다. 없다면 생성한다
      - WHIT CHECK OPTION : 해당 뷰를 통해 UPDATE와 INSERT가 가능해진다.
      - WHIT READ ONLY : 해당 뷰는 SELECT만 가능해진다.

*/