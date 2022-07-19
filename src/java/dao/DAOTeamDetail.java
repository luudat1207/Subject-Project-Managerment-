/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DataConnection.getConnection;
import entity.Team;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author buitr
 */
public class DAOTeamDetail extends DataConnection {

    Connection conn = getConnection();

    public Vector<String> listClassId(int u_id) {
        Vector<String> vector = new Vector<>();
        String sql = "select distinct t.class_id from team t, class c where t.class_id = c.class_id and trainer_id = " + u_id;
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                vector.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public int addTeam(Team t) {
        int n = 0;
        String sql = "INSERT INTO `student_project_managerment`.`Team`( `class_id`,`topic_code`,`topic_name`,`gitlab_url`,`status`) VALUES(?,?,?,?,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, t.getClass_id());
            pre.setString(2, t.getTopic_code());
            pre.setString(3, t.getTopic_name());
            pre.setString(4, t.getGitlab_url());
            pre.setInt(5, t.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public int updateTeam(Team t) {
        int n = 0;
        try {
            String sql = "UPDATE `student_project_managerment`.`Team`\n"
                    + "SET\n"
                    + "`class_id` = ?,\n"
                    + "`topic_code` = ?,\n"
                    + "`topic_name` = ?,\n"
                    + "`gitlab_url` = ?,\n"
                    + "`status` = ?\n"
                    + "WHERE `team_id` = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, t.getClass_id());
            ps.setString(2, t.getTopic_code());
            ps.setString(3, t.getTopic_name());
            ps.setString(4, t.getGitlab_url());
            ps.setInt(5, t.getStatus());
            ps.setInt(6, t.getTeam_id());
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return n;
    }

    public Team listAllByID(int team_id, int u_id) {
        Vector<Team> vec = new Vector<>();
        String sql = "select t.*, c.class_code, c.class_year, c.block5_class "
                + "from team t, class c "
                + "where t.class_id = c.class_id "
                + "and trainer_id = "+ u_id +" and t.team_id = " + team_id;
                
        ResultSet rs = getData(sql);
        try {

            while (rs.next()) {
                Team team = new Team();
                team.setTeam_id(rs.getInt("team_id"));
                team.setClass_id(rs.getInt("class_id"));
                team.setTopic_code(rs.getString("topic_code"));
                team.setTopic_name(rs.getString("topic_name"));
                team.setGitlab_url(rs.getString("gitlab_url"));
                team.setClass_code(rs.getString("class_code"));
                team.setClass_year(rs.getInt("class_year"));
                team.setBlock5_class(rs.getInt("block5_class"));
                team.setStatus(rs.getInt("status"));
                return team;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
}
