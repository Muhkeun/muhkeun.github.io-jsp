package mybatis.dao;

import mybatis.vo.MemberVO;
import org.apache.axis.session.Session;
import org.apache.ibatis.session.SqlSession;
import mybatis.service.FactoryService;

import java.util.Hashtable;
import java.util.Map;

public class memberDAO {

    public static boolean add(String m_id,
                           String m_pw,
                           String m_name,
                           String m_addr,
                           String m_phone,
                           String m_email) {
        Map<String, String> map = new Hashtable<String, String>();
        map.put("id", m_id);
        map.put("pw", m_pw);
        map.put("name", m_name);
        map.put("phone", m_phone);
        map.put("addr", m_addr);
        map.put("email", m_email);

        SqlSession ss = FactoryService.getFactory().openSession();
        boolean value = false;
        int cnt = ss.insert("mem.add", map);
        if (cnt > 0) {
            value =true;
            ss.commit();
        } else {
            //지금 까지 적용된 내용 모두 삭제하고 db적용 취소
            ss.rollback();
            ss.close();
        }
        return value;
    }

    //로그인 기능 - login.jsp에서 호출
    public static MemberVO login(String u_id, String u_pw){
        //login이라는 mapper를 사용하기 위해서 Map을 만들어서 그 곳에
        //보내고자 하는 파라미터 값 (u_id, u_pw)를 저장해야 한다.
        Map<String, String> map = new Hashtable<String, String>();
        map.put("u_id", u_id);
        map.put("u_pw", u_pw);

        SqlSession ss = FactoryService.getFactory().openSession();
        //id와 pw가 정확할 때만 vo를 받는다.
        MemberVO vo = ss.selectOne("mem.login", map);


        ss.close();
        return vo;

    }
}
