/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DataConnection.getConnection;
import entity.Class;
import entity.Team;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Luu Dat
 */
public class DAOTeam extends DataConnection {

    Connection conn = getConnection();

    public Vector<Class> queryClassTeam(int trainer_id) {
        Vector<Class> vec = new Vector<>();
        String sql = "select distinct class.class_id, class.class_code "
                + "from class "
                + "inner join team on class.class_id = team.class_id "
                + "where class.trainer_id = " + trainer_id;
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                entity.Class cla = new entity.Class();
                cla.setClass_id(rs.getInt("class_id"));
                cla.setClass_code(rs.getString("class_code"));
                vec.add(cla);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vec;
    }

    public int updateTeamStatus(int team_id, int status) {
        int n = 0;
        String sql = "update team set status = ? where team_id = ?";
        try {
            PreparedStatement pre = getConnection().prepareStatement(sql);
            pre.setInt(1, status);
            pre.setInt(2, team_id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Team> queryTeam(int pageIndex, int pageSize, int class_id, int status, String team_name, String topic_code, String class_code, String filter_col, String filter_type) {
        Vector<Team> vec = new Vector<>();
        String sql = "select team.*, class.class_code\n"
                + " from team \n"
                + " inner join class on class.class_id = team.class_id where team.class_id =  " + class_id;

        if (topic_code != null) {
            sql += " and team.topic_code like '%" + topic_code + "%'";
        }
        if (status != -1) {
            sql += " and team.status = " + status;
        }
        if (class_code != null) {
            sql += " and class.class_code like '%" + class_code + "%'";
        }
        if (team_name != null) {
            sql += " and team.team_name like '%" + team_name + "%'";
        }
        sql += " limit " + (pageIndex - 1) * pageSize + ", " + pageSize;
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                Team te = new Team();
                te.setTeam_id(rs.getInt("team_id"));
                te.setClass_id(rs.getInt("class_id"));
                te.setTeam_name(rs.getString("team_name"));
                te.setTopic_code(rs.getString("topic_code"));
                te.setTopic_name(rs.getString("topic_name"));
                te.setGitlab_url(rs.getString("gitlab_url"));
                te.setStatus(rs.getInt("status"));
                te.setClass_code(rs.getString("class_code"));
                vec.add(te);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return vec;
    }

    public int countTeam(int class_id, int status, String team_name, String topic_code, String class_code) {

        String sql = "select count(*)\n"
                + " from team \n"
                + " inner join class on class.class_id = team.class_id where team.class_id =  " + class_id;
        
        if (topic_code != null) {
            sql += " and team.topic_code like '%" + topic_code + "%'";
        }
        if (status != -1) {
            sql += " and team.status = " + status;
        }
        if (class_code != null) {
            sql += " and class.class_code like '%" + class_code + "%'";
        }
        if (team_name != null) {
            sql += " and team.team_name like '%" + team_name + "%'";
        }
        try {
            ResultSet rs = getData(sql);
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public int getProject_id(int team_id) {
        String sql = "SELECT project_id FROM student_project_managerment.team where team_id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, team_id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public String getTeam_tokent(int team_id) {
        String sql = "SELECT team_token FROM student_project_managerment.team where team_id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, team_id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
