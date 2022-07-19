package controllers;

import controllers.auth.LoginController;
import dao.DAOSetting;
import dao.DAOSubject;
import entity.Setting;
import entity.Subject;
import entity.SubjectSetting;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ptuan
 */
@WebServlet(name = "SubjectSettingController", urlPatterns = {"/subjectsetting"})
public class SubjectSettingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("action");
        response.setContentType("text/html;charset=UTF-8");
        try {
            User currentUser = LoginController.getLoginCookie(request);
            if (currentUser.getRole_id() != 1 && currentUser.getRole_id() != 2) {
                response.sendError(403);
                return;
            }
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            int first, last, pages, total, back, loop, next;
            DAOSetting dao = new DAOSetting();
            DAOSubject dao1 = new DAOSubject();
            if (service == null) {
                service = "listAll";
            }
            if (service.equals("listAll")) {

                String name_type;
                pages = (request.getParameter("pages") != null) ? (int) Integer.parseInt(request.getParameter("pages")) : 1;
                back = (pages == 1) ? 1 : pages - 1;
                total = dao.getCountSubjectSetting();
                if (total <= 10) {
                    first = 0;
                    last = total;
                } else {
                    first = (pages - 1) * 10;
                    last = 10;
                }

                loop = getMaxPage(total, first, last);
                next = getNext(total, pages);

                Vector<SubjectSetting> vector = dao.viewAllSubjectSetting(first, last);
                Vector<Setting> vector2 = dao.viewAll();
                Vector<Subject> vector3 = dao1.viewAll();
                Vector<String> vector4 = dao.viewAllTypeSubjectSetting();
                // pre some other data

                request.setAttribute("listType", vector4);
                request.setAttribute("listS", vector3);
                request.setAttribute("pre", back);
                request.setAttribute("next", next);
                request.setAttribute("page", pages);
                request.setAttribute("maxpage", loop);
                request.setAttribute("total", total);
                request.setAttribute("list", vector);
                request.setAttribute("list2", vector2);
                dispath(request, response, "/views/setting/SubjectSetting.jsp");
            }
            if (service.equals("add")) {
                String submmit = request.getParameter("submit");
                if (submmit == null) {
                    Vector<Subject> vector = dao1.viewAll();
                    Vector<String> vector1 = dao.viewAllTypeSubjectSetting();

                    request.setAttribute("subject", vector);
                    request.setAttribute("type", vector1);

                    dispath(request, response, "/views/setting/AddSubjectSetting.jsp");
                } else {
                    int id = Integer.parseInt(request.getParameter("sub_id"));
                    int type = Integer.parseInt(request.getParameter("type"));
                    String title = request.getParameter("title");
                    String value = request.getParameter("value");
                    String order = request.getParameter("Display");
                    int status = Integer.parseInt(request.getParameter("status"));

                    int n = dao.addSubjectSetting(new SubjectSetting(id, type, title, value, order, status));
                    String messeger;
                    messeger = (n == 0) ? "Add Failed!" : "Successfully!";
                    out.print(messeger);
                }
            }
            if (service.equals("edit")) {
                String submmit = request.getParameter("submit");
                if (submmit == null) {
                    int id = Integer.parseInt(request.getParameter("id"));

                    Vector<SubjectSetting> vector3 = dao.searchSubjectSetting(id);
                    Vector<Subject> vector = dao1.viewAll();
                    Vector<String> vector1 = dao.viewAllTypeSubjectSetting();

                    request.setAttribute("subject", vector);
                    request.setAttribute("type", vector1);
                    request.setAttribute("subjectsetting", vector3);

                    dispath(request, response, "/views/setting/DisplaySubjectSettingDetail.jsp");
                } else {
                    int id = Integer.parseInt(request.getParameter("sub_idx"));
                    int id_s = Integer.parseInt(request.getParameter("id_subject"));
                    int type = Integer.parseInt(request.getParameter("id_type"));
                    String title = request.getParameter("title");
                    String value = request.getParameter("value");
                    String order = request.getParameter("order");
                    int status = Integer.parseInt(request.getParameter("status"));

                    int n = dao.updateSubjectSetting(new SubjectSetting(id, id_s, type, title, value, order, status));
                    String messeger;
                    messeger = (n == 0) ? "Update Failed!" : "Update Successfully!";
                    out.print(messeger);
                }
            }
            if (service.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("ID"));
                int status = Integer.parseInt(request.getParameter("status"));
                int n = dao.deleteSubjectSetting(id, status);
                if (n > 0) {
                    response.getWriter().print("success");
                    return;
                } else {
                    response.getWriter().print("AAA");
                }
            }
            if (service.equals("searchType")) {
                pages = (request.getParameter("pages") != null) ? (int) Integer.parseInt(request.getParameter("pages")) : 1;
                back = (pages == 1) ? 1 : pages - 1;
                String sta = request.getParameter("tye");
                int tye = Integer.parseInt(sta);
                String name_type;
                total = dao.queryUsersCount(tye, -1);
                if (total <= 10) {
                    first = 0;
                    last = total;
                } else {
                    first = (pages - 1) * 10;
                    last = 10;
                }
                loop = getMaxPage(total, first, last);
                next = getNext(total, pages);
                Vector<SubjectSetting> vector = dao.querySubjectSettings(first, last, tye, -1);

                Vector<Setting> vector2 = dao.viewAll();
                Vector<Subject> vector3 = dao1.viewAll();
                Vector<String> vector4 = dao.viewAllTypeSubjectSetting();
                // pre some other data

                request.setAttribute("listType", vector4);
                request.setAttribute("tye", tye);
                request.setAttribute("listS", vector3);
                request.setAttribute("pre", back);
                request.setAttribute("next", next);
                request.setAttribute("page", pages);
                request.setAttribute("maxpage", loop);
                request.setAttribute("total", total);
                request.setAttribute("list", vector);
                request.setAttribute("list2", vector2);
                dispath(request, response, "/views/setting/SubjectSetting.jsp");
            }
            if (service.equals("searchsubject")) {
                String name_type;
                String subject = request.getParameter("name");
                if (subject == null || subject.isEmpty()) {
                    response.sendRedirect("subjectsetting");
                } else {
                    pages = (request.getParameter("pages") != null) ? (int) Integer.parseInt(request.getParameter("pages")) : 1;
                    back = (pages == 1) ? 1 : pages - 1;

                    Vector<SubjectSetting> vector = dao.searcsubject(subject);
                    total = dao.countSubj(subject);

                    if (total <= 10) {
                        first = 0;
                        last = total;
                    } else {
                        first = (pages - 1) * 10;
                        last = 10;
                    }
                    loop = getMaxPage(total, first, last);
                    next = getNext(total, pages);

                    Vector<Setting> vector2 = dao.viewAll();
                    Vector<Subject> vector3 = dao1.viewAll();
                    Vector<String> vector4 = dao.viewAllTypeSubjectSetting();
                    // pre some other data

                    request.setAttribute("listType", vector4);
                    request.setAttribute("name", subject);
                    request.setAttribute("listS", vector3);
                    request.setAttribute("pre", back);
                    request.setAttribute("next", next);
                    request.setAttribute("page", pages);
                    request.setAttribute("maxpage", loop);
                    request.setAttribute("total", total);
                    request.setAttribute("list", vector);
                    request.setAttribute("list2", vector2);
                    dispath(request, response, "/views/setting/SubjectSetting.jsp");
                }
            }
            if (service.equals("searStatus")) {
                pages = (request.getParameter("pages") != null) ? (int) Integer.parseInt(request.getParameter("pages")) : 1;
                back = (pages == 1) ? 1 : pages - 1;
                String sta = request.getParameter("sta");
                int status = Integer.parseInt(sta);
                String name_type;
                total = dao.queryUsersCount(-1, status);
                if (total <= 10) {
                    first = 0;
                    last = total;
                } else {
                    first = (pages - 1) * 10;
                    last = 10;
                }
                loop = getMaxPage(total, first, last);
                next = getNext(total, pages);
                Vector<SubjectSetting> vector = dao.querySubjectSettings(first, last, -1, status);

                Vector<Setting> vector2 = dao.viewAll();
                Vector<Subject> vector3 = dao1.viewAll();
                Vector<String> vector4 = dao.viewAllTypeSubjectSetting();
                // pre some other data

                request.setAttribute("listType", vector4);
                request.setAttribute("sta", sta);
                request.setAttribute("listS", vector3);
                request.setAttribute("pre", back);
                request.setAttribute("next", next);
                request.setAttribute("page", pages);
                request.setAttribute("maxpage", loop);
                request.setAttribute("total", total);
                request.setAttribute("list", vector);
                request.setAttribute("list2", vector2);
                dispath(request, response, "/views/setting/SubjectSetting.jsp");
            }
            if (service.equals("sort")) {
                String by2 = request.getParameter("sta");
                String by = "";
                switch (by2) {
                    case "1":
                        by = "display_order";
                        break;
                    case "2":
                        by = "type_id";
                        break;
                    case "3":
                        by = "setting_title";
                        break;
                }
                pages = (request.getParameter("pages") != null) ? (int) Integer.parseInt(request.getParameter("pages")) : 1;
                back = (pages == 1) ? 1 : pages - 1;
                total = dao.getCountSubjectSetting();

                if (total <= 10) {
                    first = 0;
                    last = total;
                } else {
                    first = (pages - 1) * 10;
                    last = 10;
                }

                loop = getMaxPage(total, first, last);
                next = getNext(total, pages);

                Vector<SubjectSetting> vector = dao.sortSettingSubject(by, first, last);
                Vector<String> vector2 = dao.viewAllTypeSubjectSetting();
                Vector<Subject> vector3 = dao1.viewAll();

                request.setAttribute("listS", vector3);
                request.setAttribute("pre", back);
                request.setAttribute("next", next);
                request.setAttribute("page", pages);
                request.setAttribute("maxpage", loop);
                request.setAttribute("total", total);
                request.setAttribute("list", vector);
                request.setAttribute("list2", vector2);

                dispath(request, response, "/views/setting/SubjectSetting.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    public void dispath(HttpServletRequest request,
            HttpServletResponse response, String page)
            throws IOException, ServletException {
        RequestDispatcher dispath = request.getRequestDispatcher(page);
        dispath.forward(request, response);
    }

    public int getMaxPage(int total, int first, int last) {
        int num, loop;
        if ((total / 10) % 2 == 0) {
            num = total / 10;
        } else {
            num = (total + 1) / 10;
        }
        //Nếu total lẻ thêm 1
        if (total % 2 != 0) {
            loop = (total / 10) + 1;
        } else {
            //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
            if (total < (num * 10) + 10 && total != num * 10) {
                loop = (total / 10) + 1;
            } else {
                //Nếu bằng fullPage thì không thêm
                loop = (total / 10);
            }
        }
        return loop;
    }

    public int getNext(int total, int pages) {
        int num = 0, next;
        //Button Next
        //Nếu total lẻ
        if (total % 2 != 0) {
            if (pages == (total / 10) + 1) {
                next = pages;//Khong next
            } else {
                next = pages + 1;//Co next
            }
        } else {
            //Nếu total chẵn nhỏ hơn fullpage
            //Và không fullPage thì thêm 1
            if (total < (num * 10) + 10 && total != num * 10) {
                if (pages == (total / 10) + 1) {
                    next = pages;//Khong next
                } else {
                    next = pages + 1;//Co next
                }
            } else {
                //Nếu fullPage đến trang cuối dừng
                //Chưa tới trang cuối thì được next
                if (pages == (total / 10)) {
                    next = pages;//Khong next
                } else {
                    next = pages + 1;//Co next
                }
            }
        }
        return next;
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
