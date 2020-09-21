package mybatis.dao;

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
}
