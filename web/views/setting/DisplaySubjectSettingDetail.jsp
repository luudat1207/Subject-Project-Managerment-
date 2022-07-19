<%-- 
    Document   : DisplaySubjectSettingDetail
    Created on : Jun 4, 2022, 9:28:43 PM
    Author     : ptuan
--%>
<%@page import="entity.SubjectSetting"%>
<%@page import="entity.Subject"%>
<%@page import="java.util.Vector"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="./">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
        <meta name="author" content="Łukasz Holeczek">
        <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
        <title>Subject Setting Details</title>
        <link rel="icon" type="image/png" sizes="192x192" href="assets/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
        <link rel="manifest" href="assets/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="assets/favicon/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <!-- Vendors styles-->
        <link rel="stylesheet" href="vendors/simplebar/css/simplebar.css">
        <link rel="stylesheet" href="css/vendors/simplebar.css">
        <!-- Main styles for this application-->
        <link href="css/style.css" rel="stylesheet">
        <!-- We use those styles to show code examples, you should remove them in your application.-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/prismjs@1.23.0/themes/prism.css">
        <link href="css/examples.css" rel="stylesheet">
        <!-- Global site tag (gtag.js) - Google Analytics-->
        <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-118965717-3"></script>
        <link href="vendors/@coreui/chartjs/css/coreui-chartjs.css" rel="stylesheet">
    </head>
    <body>
        <div class="sidebar sidebar-dark sidebar-fixed" id="sidebar">
            <div class="sidebar-brand d-none d-md-flex">
                <svg class="sidebar-brand-full" width="118" height="46" alt="CoreUI Logo">
                <use xlink:href="assets/brand/coreui.svg#full"></use>
                </svg>
                <svg class="sidebar-brand-narrow" width="46" height="46" alt="CoreUI Logo">
                <use xlink:href="assets/brand/coreui.svg#signet"></use>
                </svg>
            </div>
            <!-- Sidebar -->
            <%@ include file="/WEB-INF/jspf/sidebar.jspf" %>
            <button class="sidebar-toggler" type="button" data-coreui-toggle="unfoldable"></button>
        </div>

        <!-- Root -->
        <div class="wrapper d-flex flex-column min-vh-100 bg-light">
            <!-- Doan nay-->
            <header class="header header-sticky mb-4">
                <div class="container-fluid">
                    <!-- NavBar -->
                    <%@ include file="/WEB-INF/jspf/header.jspf" %>
                    <!-- Profile -->
                    <%@ include file="/WEB-INF/jspf/profile.jspf" %>
                </div>
                <div class="header-divider"></div>
                <div class="container-fluid">
                    <!-- Breadcrum -->
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb my-0 ms-2">
                            <li class="breadcrumb-item">
                                <!-- if breadcrumb is single--><span>Home</span>
                            </li>
                            <li class="breadcrumb-item active"><span>Dashboard</span></li>
                            <li class="breadcrumb-item active"><span>Setting Subject</span></li>
                            <li class="breadcrumb-item active"><span>Setting Subject Detail</span></li>
                        </ol>
                    </nav>
                </div>
            </header>

            <!-- Body -->
            <div class="body flex-grow-1 px-3">
                <div class="container-lg">

                    <div class="car">
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

                        <!-- The Modal -->
                        <div class="modal" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Confirm</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        Are you sure you want to update the Setting Subject?
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-info" data-bs-dismiss="modal" onclick="update()">Oke</button>
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Table Content-->

                    <div class="card mb-4">
                        <%
                            Vector<String> vector = (Vector<String>) request.getAttribute("type");
                            Vector<Subject> vector2 = (Vector<Subject>) request.getAttribute("subject");
                            Vector<SubjectSetting> subjectS = (Vector<SubjectSetting>) request.getAttribute("subjectsetting");
                        %>
                        <div class="card-header"><strong>Subject Setting Management</strong></div>
                        <div class="card-body">
                            <div class="tab-content rounded-bottom">
                                <div class="tab-pane p-3 active preview" role="tabpanel" id="preview-752">
                                    <form id="myForm">
                                        <table class="table">
                                            <tbody>
                                                <%for (SubjectSetting elem : subjectS) {%>
                                                <tr style="display: none">
                                                    <td><div id="set_id"><%=elem.getSetting_id()%></div></td>
                                                </tr>

                                                <tr >
                                                    <th scope="row">Subject:</th>
                                                    <td>
                                                        <select id="sub_name" class="form-control">
                                                            <%
                                                                for (Subject elem2 : vector2) {
                                                                    if (elem.getSubject_id() == elem2.getSubject_id()) {
                                                            %>
                                                            <option value="<%=elem2.getSubject_id()%>" selected=""><%=elem2.getSubject_name()%></option>
                                                            <%} else {%>
                                                            <option value="<%=elem2.getSubject_id()%>"><%=elem2.getSubject_name()%></option>
                                                            <%}
                                                                }%>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Type:</th>
                                                    <td>
                                                        <select id="type" class="form-control">
                                                            <%
                                                                for (String vec : vector) {
                                                                    String name = (String) session.getAttribute(vec);
                                                                    if (elem.getType_id() == Integer.parseInt(vec)) {
                                                            %>
                                                            <option value="<%=vec%>" selected><%=name%></option>
                                                            <%} else {%>
                                                            <option value="<%=vec%>"><%=name%></option>
                                                            <%}
                                                                }%>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Title:</th>
                                                    <td>
                                                        <input class="form-control" type="text" value="<%=elem.getSetting_tile()%>" id="sub_title" onkeypress="clsAlphaNoOnly(event)" onpaste="return false;" maxlength="20" required="">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Value</th>
                                                    <td>
                                                        <input class="form-control" type="text" value="<%=elem.getSetting_value()%>" id="sub_value" onkeypress="clsAlphaNoOnly(event)" onpaste="return false;" maxlength="20" required="">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Order:</th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-9">
                                                                <input class="form-control" type="number" value="<%=elem.getDisplay_order()%>" id="order" oninput="validity.valid||(value='');" onpaste="return false;" min="1" max="10" required="">
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Status:</th>
                                                    <td>
                                                        <%if (elem.getStatus() == 1) {%>
                                                        <input type="radio" name="status" value="1" checked="checked"> Active
                                                        <input type="radio" name="status" value="0" onclick="editStatus()"> Inactive
                                                        <%} else {%>
                                                        <input type="radio" name="status" value="1" onclick="editStatus()"> Active
                                                        <input type="radio" name="status" value="0" checked="checked"> Inactive
                                                        <%}%>
                                                    </td>
                                                </tr>
                                                <%}%>
                                                <tr>
                                                <tr>
                                                    <td>
                                                        <button class="btn btn-outline-info" type="reset">Reset</button>
                                                        <button class="btn btn-primary" type="button" id="submit" data-bs-toggle="modal" data-bs-target="#myModal">Update Subject Setting</button>
                                                    </td>
                                                </tr>
                                                </tr>
                                            </tbody>
                                        </table> 
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <%@ include file="/WEB-INF/jspf/footer.jspf" %>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://unpkg.com/toastmaker/dist/toastmaker.min.css">
        <script type="text/javascript" src="https://unpkg.com/toastmaker/dist/toastmaker.min.js"></script>
        <!-- CoreUI and necessary plugins-->
        <script src="vendors/@coreui/coreui/js/coreui.bundle.min.js"></script>
        <script src="vendors/simplebar/js/simplebar.min.js"></script>
        <!-- Plugins and scripts required by this view-->
        <script src="vendors/chart.js/js/chart.min.js"></script>
        <script src="vendors/@coreui/chartjs/js/coreui-chartjs.js"></script>
        <script src="vendors/@coreui/utils/js/coreui-utils.js"></script>
        <script src="js/main.js"></script>
        <script src="js/add.js"></script>
    </body>
</html>
