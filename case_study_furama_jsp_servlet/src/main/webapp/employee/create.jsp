<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Employee Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="/static/bootstrap-4.3.1-dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../common/header-navbar.jsp"></jsp:include>
    <div class="row">
        <div class="col-2 bg-light">
            <jsp:include page="../common/left-sidebar.jsp"></jsp:include>
        </div>

        <div class="col-10">
            <a href="/employee" class="btn btn-dark">Back to list all employees</a>
            <div class="row">
                <h4>
                    <c:if test='${requestScope["message1"] != null}'>
                        <span class="message">${requestScope["message1"]}</span>
                    </c:if>
                </h4>
                <h4>
                    <c:if test='${requestScope["message2"] != null}'>
                        <span class="message text-danger">${requestScope["message2"]}</span>
                    </c:if>
                </h4>
            </div>
            <form method="post">
                <legend>Employee information</legend>
                <div class="row mt-2">
                    <div class="col-5">
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Name</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="name" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Birthday</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="birthday" id="datepicker" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Id card</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="id_card" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Salary</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="salary" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Phone</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="phone" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Email</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="email" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Address</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="address" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Position</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="position_id">
                                    <option selected>Ch???n v??? tr??</option>
                                    <option value="1">L??? t??n</option>
                                    <option value="2">Ph???c v???</option>
                                    <option value="3">Chuy??n vi??n</option>
                                    <option value="4">Gi??m s??t</option>
                                    <option value="5">Qu???n l??</option>
                                    <option value="6">Gi??m ?????c</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Education degree</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="education_degree_id">
                                    <option selected>Ch???n tr??nh ?????</option>
                                    <option value="1">Trung c???p</option>
                                    <option value="2">Cao ?????ng</option>
                                    <option value="3">?????i h???c</option>
                                    <option value="4">Sau ?????i h???c</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Division</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="division_id">
                                    <option selected>Ch???n b??? ph???n</option>
                                    <option value="1">Sale - Marketing</option>
                                    <option value="2">H??nh ch??nh</option>
                                    <option value="3">Ph???c v???</option>
                                    <option value="4">Qu???n l??</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Username</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="username" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                            </div>
                            <div class="col-6">
                                <input type="submit" class="form-control" value="Create new employee">
                            </div>
                            <div class="col-2">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>


<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script>
    $( function() {
        $( "#datepicker" ).datepicker({
            dateFormat: 'dd-mm-yy',
            changeMonth: true,
            changeYear: true,
            yearRange:'-120:+80'
        });
    } );
</script>
</body>
</html>
