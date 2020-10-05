package shop.bean;

import mybatis.vo.ProductVO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart {
//    카트의 기능 분석
//    1) 제품(ProductVO)을 담을(저장) 수 있는 공간 : List<ProductVO>
//    2) 1번에서 제품을 저장하는 기능
//    3) 1번에서 제품을 삭제하는 기능
//    4) 1번에서 모든 제품들을 배열로 반환하는 기능
//    5) 1번에서 특정제품을 검색하는 기능 : (삭제하기 전에 검색한 후 삭제해야 한다.)
//    6) 5번에서 검색된 제품의 수량을 변경하는 기능
//    7) 총액 계싼

//    위 분석에 따른 필요한 멤버변수들(속성)
//    -List<ProductVO)
//    int totalPrice(없어도 됨)

//    카트의 기능(멤버메서드)
//    -searchProduct: 제품 검색 기능
//    -addProduct: 제품 추가기능
//    -delProduct: 제품 삭제기능
//    -changeAmount: 수량 변경기능
//    -getList: 배열로 반환하는 기능

    //    저장공간
    private List<ProductVO> list;

    public Cart() {
        list = new ArrayList<ProductVO>();
    }

    //    Cart에서 특정 제품(ProductVO)을 검색하여 반환하는 기능(Method)
    public ProductVO searchProduct(String productNum) {
//        for(ProductVO vo : list){
//            if(vo.getP_num().equals(productNum))
//                return vo;
//        }
//        return null;
//    }
//    검색 속도를 높이기 위해 반복자를 사용
        Iterator<ProductVO> iterator = list.iterator();
        while (iterator.hasNext()) {
//          현재 반복자(커서)의 위치에서 바로 다음칸에 요소가 있다면 true, 없으면 false
            ProductVO vo = iterator.next();

//          반복자가 다음칸으로 이동하여 그곳에 있는 자원을 vo에 저장
            if (vo.getP_num().equals(productNum)){
                return vo;
            }//if
        }//while
        return null;
    }

//    Cart에 저장된 모든 제품들을 하나의 배열로 반환하는 기능
public ProductVO[] getList() {
    ProductVO[] ar = null;

    if(list != null && list.size() > 0) {
        ar = new ProductVO[list.size()];
        list.toArray(ar);
    }
    return ar;
}

//    Cart에서 특정 제품을 검색하여 삭제하는 기능
    public boolean delProduct(String productNum){
        boolean value = false;

        ProductVO vo =searchProduct(productNum);
        if(vo != null){
            list.remove(vo);
            value =true;
        }
        return value;
    }

    //제품을 카트에 저장하는 기능
    public void addProduct(ShopBean sb, String productNum){

//        현재 인자로 넘어온 선택된 제품번호가 이미 카트에 저장된 제품일 수도 있기 때문에
//        먼저 카트에서 검색부터 한다.
        ProductVO vo = searchProduct(productNum);

//           이미 카트에 저장된 제품이다.
        if(vo != null){
//            기존 저장된 제품의 수량을 먼저 얻어낸다.
            int q = vo.getQuant();

//         제어권 호출한 곳으로 반환한다. 즉, 함수가 더 이상 수행하지 않는다.
            vo.setQuant(q+1);
            return;
        }

//        vo가 null을 가진 경우! (같은 제품이 카트에 없는 경우)
//        선택한 제품을 진열대에서 가져오기 위해 진열대 객체의 productNum이라는 멤버변수의 값을
//        인자로 넘어온 pnum으로 변경한다.
        // 1번
        sb.setProductNum(productNum);
        // 2번
        vo = sb.getProduct();

        //가져온 제품의 수량을 지정한다.
        vo.setQuant(1);

        //3번 카트에 저장
        list.add(vo);
    }

    //카트에서 원하는 제품을 검색한 후 수량만 변경하는 기능
    public void changeAmount(String productNum, int q){
        ProductVO vo = searchProduct(productNum);
        if(vo != null)
            vo.setQuant(q);
    };
}

