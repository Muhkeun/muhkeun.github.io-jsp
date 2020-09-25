package vo;

public class DataVO {
    private String m_id, m_name;
    private int m_age;
    private String[] m_phone;

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public int getM_age() {
        return m_age;
    }

    public void setM_age(int m_age) {
        this.m_age = m_age;
    }

    public String[] getPhone() {
        return m_phone;
    }

    public void setPhone(String[] m_phone) {
        this.m_phone = m_phone;
    }
}
