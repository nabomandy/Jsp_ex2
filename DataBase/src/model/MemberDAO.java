package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// ����Ŭ �����ͺ��̽��� �����ϰ� select, insert, update, delete �۾��� �������ִ� Ŭ�����Դϴ�.
public class MemberDAO {

  // ����Ŭ�� �����ϴ� �ҽ��� �ۼ�
  String id = "kic"; // ���Ӿ��̵�
  String pass = "1234";
  String url = "jdbc:oracle:thin:@localhost:1521:xe"; // ���� url

  Connection con; // �����ͺ��̽��� ������ �� �ֵ��� ����
  PreparedStatement pstmt; // �����ͺ��̽����� ������ ��������ִ� ��ü����
  ResultSet rs; // �����ͺ��̽� ���̺��� ����� ���Ϲ޾� �ڹٿ� �������ִ� ��ü


  // ������ ���̽��� ������ �� �ֵ��� �����ִ� �޼ҵ�
  public void getCon() {

    try {
      // 1. �ش� ������ ���̽��� ����Ѵٰ� ����(Ŭ������ ���=����Ŭ���� ���)
      Class.forName("oracle.jdbc.driver.OracleDriver");
      // 2. �ش� ������ ���̽��� ����
      con = DriverManager.getConnection(url, id, pass);
    } catch (Exception e) {
      // TODO: handle exception
    }
  }

  // ������ ���̽��� �ѻ���� ȸ�� ������ �������ִ� �޼ҵ�
  public void insertMenu(MenuBean mbean) {

    try {
      getCon();
      // 3. ���� �� �����غ��Ͽ� ������ ����ϵ��� ����
      String sql = "insert into MEMBER_INF values(?,?,?,?,?,?,?,?)";
      // ������ ����ϵ��� ����
      PreparedStatement pstmt = con.prepareStatement(sql); // jsp���� ������ ����ϵ��� ����
      // ?�� �°� �°� �����͸� ����
      pstmt.setString(1, mbean.getId());
      pstmt.setString(2, mbean.getPass1());
      pstmt.setString(3, mbean.getEmail());
      pstmt.setString(4, mbean.getTel());
      pstmt.setString(5, mbean.getHobby());
      pstmt.setString(6, mbean.getJob());
      pstmt.setString(7, mbean.getAge());
      pstmt.setString(8, mbean.getInfo());
      // 4. ����Ŭ���� ������ �����Ͻÿ�
      pstmt.executeUpdate();// insert, update, delete �� ����ϴ� �޼ҵ�

      // 5. �ڿ� �ݳ�
      con.close();


    } catch (Exception e) {
      e.printStackTrace();
    }


  }

}
