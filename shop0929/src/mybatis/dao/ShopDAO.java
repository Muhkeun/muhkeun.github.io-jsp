package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ShopDAO {

    //카테고리별 목록을 반환하는 기능
//    public static List<ProductVO> getList(String category){
//
//
//        SqlSession ss = FactoryService.getFactory().openSession();
//        List<ProductVO> list = ss.selectList("shop.list", category);
//
//        ss.close();
//        return list;
//    }

    public static ProductVO[] getList(String category){

        SqlSession ss = FactoryService.getFactory().openSession();

        //반환값
        ProductVO[] arr = null;

        List<ProductVO> list = ss.selectList("shop.list", category);
        ss.close();

        //받은 리스트를 배열로 변경
        if(list != null && list.size() >0){
            //list와 크기가 동일하게 배열을 생성
            arr = new ProductVO[list.size()];

            //배열이 List와 같은 크기이므로 list에 있는 모든 요소들을 배열에 복사해 담기(toArray)
            list.toArray(arr);
            }

        return arr;
    }

    public static ProductVO[] getItem(String productNum){

        SqlSession ss = FactoryService.getFactory().openSession();

        //반환값
        ProductVO[] arr = null;

        List<ProductVO> list = ss.selectList("shop.more", productNum);
        ss.close();

        //받은 리스트를 배열로 변경
        if(list != null && list.size() >0){
            //list와 크기가 동일하게 배열을 생성
            arr = new ProductVO[list.size()];

            //배열이 List와 같은 크기이므로 list에 있는 모든 요소들을 배열에 복사해 담기(toArray)
            list.toArray(arr);
        }

        return arr;
    }

}
