package shop.bean;

import mybatis.dao.ShopDAO;
import mybatis.vo.ProductVO;

public class ShopBean {
    // jsp:setProperty에 의해 자동 저장
    private String category;

    //카테고리 값으로 제품들을 선별한 후 배열로 저장할 곳
    private ProductVO[] productlist;

    //제품 상세보기 기능에서 사용할 제품 번호
    private String productNum;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public ProductVO[] getProductlist() {
        return productlist;
    }

    public void setProductlist(ProductVO[] productlist) {
        this.productlist = productlist;
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }

    //제품목록를 ShopDAO를 통해 생성
    public void searchProduct(){
        //category를 이미 <jsp:setProperty> 로 들어온 상태이기 때문에 바로 사용 가능
        productlist = ShopDAO.getList(category);
    }
    //사용자가 상세보기를 하기 위해 제품 번호를 이용
    //=> 원하는 제품을 제품목록에서 검색한 후 ProductVO를 반환하여 표현
    public ProductVO getProduct() {
        ProductVO pvo = null;
        for (ProductVO vo : productlist) {
            if (vo.getP_num().equals(productNum)) {
                pvo = vo;
                break;
            }//if
        }//for
        //사용자가 선택한 제품은 이미 Product
        return pvo;
    }
}
