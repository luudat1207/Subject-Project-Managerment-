/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import controllers.auth.LoginController;
import dao.DAOFeature;
import dao.DAOTeamDetail;
import entity.Team;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Validator;

/**
 *
 * @author buitr
 */
@WebServlet(name = "TeamDetailController", urlPatterns = {"/teamDetail"})
public class TeamDetailController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        DAOTeamDetail dao = new DAOTeamDetail();
        try (PrintWriter out = response.getWriter()) {
            int role = LoginController.getLoginCookie(request).getRole_id();
            int u_id = LoginController.getLoginCookie(request).getUser_id();
            String service = request.getParameter("go");
            if (service.equals("edit")) {
                if (role != 3) {
                    response.sendError(403);
                } else {
                    String error_list = "";
                    String submit = request.getParameter("submit");
                    if (submit == null) {
                        int team_id = Integer.parseInt(request.getParameter("team_id"));
                        Team team = dao.listAllByID(team_id, u_id);
                        if (team == null) {
                            response.sendError(403);
                        } else {
                            request.setAttribute("team", team);
                            disPath(request, response, "/views/teamDetail/UpdateTeam.jsp");
                        }

                    } else {
                        try {
                            String team_id = request.getParameter("team_id");
                            String class_id = request.getParameter("class_id");
                            String topic_code = request.getParameter("topic_code");
                            String status = request.getParameter("status") == null ? "-1" : request.getParameter("status");
                            String topic_name = request.getParameter("topic_name");
                            String gitlab_url = request.getParameter("gitlab_url");
                            if (!Validator.checkName(topic_code)) {
                                error_list = error_list + "|topic_code";
                            }
                            if (!Validator.checkName(topic_name)) {
                                error_list = error_list + "|topic_name";
                            }
                            if (!Validator.checkStatus(status)) {
                                error_list = error_list + "|status";
                            }

                            if (!Validator.checkID(class_id)) {
                                error_list = error_list + "|class_id";
                            }
//                            if (!Validator.checkGitLabLink(gitlab_url)) {
//                                error_list = error_list + "|gitlab_url";
//                            }
                            if (!"".equals(error_list)) {
                                throw new Exception(error_list.substring(1));
                            }

                            int n = dao.updateTeam(new Team(Integer.parseInt(team_id), Integer.parseInt(class_id), topic_code, topic_name, gitlab_url, Integer.parseInt(status)));
                            if (n == 0) {
                                out.print("fail");
                            } else {
                                out.print("success");
                            }
                        } catch (Exception e) {
                            out.print("error: " + e.getMessage());
                        }
                    }

                }
            }
            if (service.equals("add")) {
                if (role != 3) {
                    response.sendError(403);
                } else {
                    String error_list = "";
                    String submit = request.getParameter("submit");
                    if (submit == null) {
                        Vector<String> listClassId = dao.listClassId(u_id);
                        request.setAttribute("listClassId", listClassId);
                        disPath(request, response, "/views/teamDetail/AddTeam.jsp");
                    } else {
                        try {
                            String class_id = request.getParameter("class_id");
                            String topic_code = request.getParameter("topic_code");
                            String status = request.getParameter("status") == null ? "-1" : request.getParameter("status");
                            String topic_name = request.getParameter("topic_name");
                            String gitlab_url = request.getParameter("gitlab_url"); 
                            if (!Validator.checkName(topic_code)) {
                                error_list = error_list + "|topic_code";
                            }
                            if (!Validator.checkName(topic_name)) {
                                error_list = error_list + "|topic_name";
                            }
                            if (!Validator.checkStatus(status)) {
                                error_list = error_list + "|status";
                            }

                            if (!Validator.checkID(class_id)) {
                                error_list = error_list + "|class_id";
                            }
//                            if (!Validator.checkGitLabLink(gitlab_url)) {
//                                error_list = error_list + "|gitlab_url";
//                            }
                            if (!"".equals(error_list)) {
                                throw new Exception(error_list.substring(1));
                            }

                            Team s = new Team();
                            s.setClass_id(Integer.parseInt(class_id));
                            s.setTopic_code(topic_code);
                            s.setStatus(Integer.parseInt(status));
                            s.setTopic_name(topic_name);
                            s.setGitlab_url(gitlab_url);
                            int n = dao.addTeam(s);

                            if (n == 0) {
                                out.print("fail");
                            } else {
                                out.print("success");
                            }
                        } catch (Exception e) {
                            out.print("error: " + e.getMessage());
                        }
                    }
                }
            }
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
