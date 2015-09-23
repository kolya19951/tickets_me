package Model.Observer;

import Model.Entity.City;
import database.DBWorker;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by ����� on 13.09.2015.
 */
public abstract class CitiesObserver {
    public static ArrayList<City> selectCities(String lang) {
        ArrayList<City> cities = new ArrayList<City>();
        ResultSet resultSet = null;
        String query = "SELECT * FROM cities";
        DBWorker dbWorker = new DBWorker();
        resultSet = dbWorker.executeQuery(query);
        try {
            while (resultSet.next()) {
                cities.add(new City(resultSet.getInt("id"), resultSet.getString("name_"+lang+"")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cities;
    }

    public static ArrayList<String> selectCitiesNames(String lang) {
        ArrayList<String> cities = new ArrayList<String>();
        ResultSet resultSet = null;
        String query = "SELECT name FROM cities";
        DBWorker dbWorker = new DBWorker();
        resultSet = dbWorker.executeQuery(query);
        try {
            while (resultSet.next()) {
                cities.add(new City(resultSet.getString("name_"+lang+"")).getName());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cities;
    }
}
