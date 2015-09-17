package payment;

import database.DBWorker;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by ���� on 12.09.2015.
 */
public class Payment {

    private String ip, ik_co_id, ik_co_prs_id, ik_inv_id, ik_inv_st, ik_inv_crt, ik_inv_prc, ik_trn_id, ik_pm_no, ik_pw_via, ik_am, ik_co_rfn, ik_ps_price, ik_cur, ik_desc, ik_sign;

    private long id;

    public Payment() {
    }

    public Payment(String ik_co_id, String ik_pm_no, String ik_am, String ik_co_rfn, String ik_desc, String nameSurnname) {
        String query = "INSERT INTO payment (ik_co_id, ik_pm_no, ik_am, ik_co_rfn, ik_desc, name) VALUES ('" + ik_co_id + "', '" + ik_pm_no + "', '" + ik_am + "', '" + ik_co_rfn + "', '" + ik_desc + "','" + nameSurnname + "')";
        DBWorker dbWorker = new DBWorker();
        dbWorker.execute(query);
        ResultSet resultSet = dbWorker.executeQuery("SELECT LAST_INSERT_ID()");
        long id = 0;
        try {
            resultSet.next();
            id = resultSet.getLong(1);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Вы ничего не ввели");
        }
        dbWorker.closeConnection();
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public Payment(String ik_co_id, String ik_pm_no, String ik_am, String ik_co_rfn, String ik_desc, String nameSurnname, int action, String phone, String email) {
        String query = "";
        if (action == 1)
            query = "INSERT INTO payment (ik_co_id, ik_pm_no, ik_am, ik_co_rfn, ik_desc, name, phone) VALUES ('" + ik_co_id + "', '" + ik_pm_no + "', '" + ik_am + "', '" + ik_co_rfn + "', '" + ik_desc + "','" + nameSurnname + "', '" + phone + "')";
        if (action == 2)
            query = "INSERT INTO payment (ik_co_id, ik_pm_no, ik_am, ik_co_rfn, ik_desc, name, email) VALUES ('" + ik_co_id + "', '" + ik_pm_no + "', '" + ik_am + "', '" + ik_co_rfn + "', '" + ik_desc + "','" + nameSurnname + "', '" + email + "')";
        if (action == 3)
            query = "INSERT INTO payment (ik_co_id, ik_pm_no, ik_am, ik_co_rfn, ik_desc, name, phone, email) VALUES ('" + ik_co_id + "', '" + ik_pm_no + "', '" + ik_am + "', '" + ik_co_rfn + "', '" + ik_desc + "','" + nameSurnname + "', '" + phone + "', '" + email + "')";

        DBWorker dbWorker = new DBWorker();
        dbWorker.execute(query);
        dbWorker.closeConnection();
    }

    public Payment(String ip, String ik_co_id, String ik_co_prs_id, String ik_inv_id, String ik_inv_st, String ik_inv_crt, String ik_inv_prc, String ik_trn_id, String ik_pm_no, String ik_pw_via, String ik_am, String ik_co_rfn, String ik_ps_price, String ik_cur, String ik_desc, String ik_sign) {
        this.ip = ip; // ип отправителя
        this.ik_co_id = ik_co_id; // идентификатор кассы
        this.ik_co_prs_id = ik_co_prs_id; //идентификатор кошелька кассы
        this.ik_inv_id = ik_inv_id; //идентификатор платежа
        this.ik_inv_st = ik_inv_st; //состояние платежа
        this.ik_inv_crt = ik_inv_crt; //время создания платежа
        this.ik_inv_prc = ik_inv_prc; //время проведения платежа
        this.ik_trn_id = ik_trn_id; //Идентификатор транзакции
        this.ik_pm_no = ik_pm_no; //номер платежа
        this.ik_pw_via = ik_pw_via; //выбраный способ оплаты
        this.ik_am = ik_am; //сумма платежа
        this.ik_co_rfn = ik_co_rfn; //сумма зачисленая на счет кассы
        this.ik_ps_price = ik_ps_price; //сумма платежа в платежной системе
        this.ik_cur = ik_cur; //валюта платежа
        this.ik_desc = ik_desc; //описание платежа
        this.ik_sign = ik_sign; //цифровая подпись
    }


    public boolean checkAll() {
        if (checkCass(ik_co_id) && checkStatus(ik_inv_st) && checkIP(ip) && checkCost(ik_am, "100") && checkDesc(ik_desc, "Event Description") && checkID(ik_pm_no, "ID_4233") && checkRefund(ik_co_rfn, "100"))
            return true;
        else return false;
    }

    private boolean checkCass(String cass) {
        if (cass.equals("55f353513b1eaff4408b4567"))
            return true;
        else return false;
    }

    private boolean checkIP(String IP) {
        String ip_mass[] = new String[8];
        for (int i = 0; i < 8; i++) {
            ip_mass[i] = "151.80.190." + String.valueOf(97 + i);
            if (IP.equals(ip_mass[i]))
                return true;
        }
        return false;
    }

    private boolean checkID(String pay_ID, String true_ID) {
        if (pay_ID.equals(true_ID))
            return true;
        else
            return false;
    }

    private boolean checkStatus(String status) {
        if (status.equals("success"))
            return true;
        else return false;
    }

    private boolean checkCost(String cost, String true_Cost) {
        if (cost.equals(true_Cost))
            return true;
        else return false;
    }

    private boolean checkRefund(String refund, String true_Refund) {
        if (refund.equals(true_Refund))
            return true;
        else return false;
    }

    private boolean checkDesc(String description, String true_Description) {
        if (description.equals(true_Description))
            return true;
        else return false;
    }
}
