/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import controllers.auth.LoginController;
import dao.DAOTeam;
import entity.Team;
import entity.Class;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.StringValidation;
import utils.Validator;

/**
 *
 * @author Luu Dat
 */
@WebServlet(name = "TeamController", urlPatterns = {"/team"})
public class TeamController extends HttpServlet {

    DAOTeam dao = new DAOTeam();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int role = LoginController.getLoginCookie(request).getRole_id();
        int trainer_id = LoginController.getLoginCookie(request).getUser_id();
        String service = request.getParameter("go");
        if (service == null) {
            service = "view";
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (service.equals("view")) {

                String sPageIndex = request.getParameter("page");
                String sPageSize = request.getParameter("size");
                int pageIndex = (sPageIndex == null || "".equals(sPageIndex)) ? 1 : Integer.parseInt(sPageIndex);
                int pageSize = (sPageSize == null || "".equals(sPageSize)) ? 5 : Integer.parseInt(sPageSize);
                if (pageIndex <= 0) {
                    pageIndex = 1;
                }
                if (pageSize <= 0) {
                    pageSize = 5;
                }

                String sStatus = request.getParameter("status");
                int status = (sStatus == null || "".equals(sStatus)) ? -1 : Integer.parseInt(sStatus);

                String TeamID = request.getParameter("team_id");
                int teamID = (TeamID == null || "".equals(TeamID) || !StringValidation.isInteger(TeamID)) ? -1 : Integer.parseInt(TeamID);
                String class_code = request.getParameter("class_code");
                class_code = (class_code == null || "".equals(class_code) || !Validator.checkExitClassCode(class_code)) ? null : class_code;
                String sClass_id = request.getParameter("class_id");
                int class_id = (sClass_id == null || "".equals(sClass_id)) ? -1 : Integer.parseInt(sClass_id);
                String topic_code = request.getParameter("topic");
                topic_code = (topic_code == null || "".equals(topic_code)) ? null : topic_code;
                
                String team_name = request.getParameter("team_name");
                team_name = (team_name == null || "".equals(team_name)) ? null : team_name;

                //get sorting filter request
                String str = "team.team_id|class.class_code|team.team_name|team.topic_code|team.gitlab_url";
                String[] filter_keys = str.split("\\|");
                String[] filter_types = new String[filter_keys.length];
                String filter_col = null;
                String filter_type = null;
                for (int i = 0; i < filter_keys.length; i++) {
                    String sKey = request.getParameter(filter_keys[i].substring(filter_keys[i].indexOf(".") + 1));
                    String sType = (sKey == null || (!"asc".equals(sKey) && !"desc".equals(sKey))) ? null : sKey;
                    if (sType != null) {
                        filter_col = filter_keys[i];
                        filter_type = sType;
                        filter_types[i] = (filter_type.equals("asc")) ? "desc" : "asc";
                    } else {
                        filter_types[i] = "asc";
                    }
                }

                Vector<Team> teams = dao.queryTeam(pageIndex, pageSize, class_id, status, team_name, topic_code, class_code, filter_col, filter_type);
//                Vector<Class> classes = dao.queryClassTeam(trainer_id);
                int totalTeam = dao.countTeam(class_id, status, team_name, topic_code, class_code);

                request.setAttribute("search_value", team_name != null ? team_name : topic_code);
                request.setAttribute("filter_types", filter_types);
                request.setAttribute("teams", teams);
//                request.setAttribute("classes", classes);
                request.setAttribute("pageIndex", pageIndex);
                request.setAttribute("totalSize", (int) Math.ceil((double) totalTeam / pageSize));
                disPath(request, response, "/views/team/TeamList.jsp");

            } else if (service.equals("update_status")) {
                int team_id = Integer.parseInt(request.getParameter("team_id"));
                int status = Integer.parseInt(request.getParameter("status"));
                int n = dao.updateTeamStatus(team_id, status);
                if (n != 0) {
                    out.print("success");
                } else {
                    out.print("failed");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void disPath(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        RequestDispatcher dispath = request.getRequestDispatcher(path);
        dispath.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        //    request.getRequestDispatcher("/views/team/TeamList.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
