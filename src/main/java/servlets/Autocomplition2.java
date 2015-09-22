package servlets;

import Model.Entity.City;
import Model.Hash.Composer;
import Model.Hash.ComposerData;
import database.DBWorker;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;

/**
 * Created by on 13.09.2015.
 */
@WebServlet("/autocomplete")
public class Autocomplition2 extends HttpServlet {
    private static String str;
    private ServletContext context;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String targetId = request.getParameter("name");
        StringBuffer sb = new StringBuffer();

        boolean namesAdded = false;
        if (action.equals("complete")) {
            if (!targetId.equals("")) {
                DBWorker dbWorker = new DBWorker();
                String query = "SELECT * FROM cities WHERE (name_en LIKE '%" + targetId + "%') OR (name_ru LIKE '%" + targetId + "%')";
                System.out.println();
                ResultSet resultSet = dbWorker.executeQuery(query);

                try {
                    sb.append("<cities>");
                    sb.append("<action><name>autocomplete</name></action>");
                    while (resultSet.next()) {
                        sb.append("<city>");
                        sb.append("<id>" + resultSet.getLong("Id") + "</id>");
                        sb.append("<name_en>" + resultSet.getString("name_en") + "</name_en>");
                        sb.append("<name_ru>" + resultSet.getString("name_ru") + "</name_ru>");
                        sb.append("</city>");
                        namesAdded = true;
                    }
                    sb.append("</cities>");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                dbWorker.closeConnection();
            }
            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                String s = sb.toString();
                response.getWriter().write(s);
                System.out.println();
            } else {
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }
}