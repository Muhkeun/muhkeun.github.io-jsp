package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MemoVO;
import oracle.sql.BfileDBAccess;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

public class MemoDAO {
    public static List<MemoVO> getList(){
        SqlSession ss = FactoryService.getFactory().openSession();

        List<MemoVO> list = ss.selectList("memo.total");

        ss.close();

        return list;
    }
    public static boolean add(String writer, String content, String ip){
        //인자로 넘어 온 값들을 add라는 mapper를 호출하면서 전달해야 하므로
        //하나의 Map구조로 저장한다.
        Map<String, String> map = new Hashtable<String, String>();
        map.put("writer", writer);
        map.put("content", content);
        map.put("ip",ip);

        boolean value = false; //반환값

        SqlSession ss = FactoryService.getFactory().openSession();
        //저장에 성공하면 1을 반환
        int cnt = ss.insert("memo.add", map);
        if(cnt > 0) {
            value = true;
            ss.commit();
        }else{
            //지금 까지 적용된 내용 모두 삭제하고 db적용 취소
            ss.rollback();
        }
        ss.close();
        return value;
    }
    public static MemoVO getMemo(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        MemoVO vo = ss.selectOne("memo.get_memo", idx);
        ss.close();
        return vo;

    }

    //검색기능
    public static  List<MemoVO> search(String searchType, String searchValue){
        Map<String, String>map = new Hashtable<String, String>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<MemoVO> list = ss.selectList("memo.search", map);
        ss.close();

        return list;
    }
}
