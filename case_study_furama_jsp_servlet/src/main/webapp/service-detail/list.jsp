<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/10/2021
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Service detail Management</title>
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
            <a href="/home" class="btn btn-dark">Back home</a>
            <div class="row">
                <div class="col-4">
                    <h4>List all services detail</h4>
                </div>
            </div>
            <table class="table table-striped" id="tableServiceDetail">
                <thead>
                <tr>
                    <th>Service Id</th>
                    <th>Service name</th>
                    <th>Customer name</th>
                    <th>Contract Id</th>
                    <th>Contract of start date</th>
                    <th>Contract of end date</th>
                    <th>Total</th>
                    <th>Contract Detail</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope['serviceDetailList']}" var="serviceDetail">
                    <tr>
                        <td>${serviceDetail.serviceId}</td>
                        <td>${serviceDetail.serviceName}</td>
                        <td>${serviceDetail.customerName}</td>
                        <td>${serviceDetail.contractId}</td>
                        <td>${serviceDetail.contractOfStartDate}</td>
                        <td>${serviceDetail.contractOfEndDate}</td>
                        <td>${serviceDetail.total}</td>
                        <td>
                            <c:if test="${serviceDetail.contractDetailId != 0}">
                                <a href = "<c:url value = "/service-contract-detail?action=show&id=${serviceDetail.contractId}"/>" class="btn btn-success">Contract detail</a>
                            </c:if>
                        </td>
                        <td>
                            <a href="<c:url value = "/service-detail?action=edit&id=${serviceDetail.contractId}"/>" class="btn btn-warning">Edit</a>
                        </td>
                        <td>
                            <button onclick="onDelete(${serviceDetail.contractId})" type="button" class="btn btn-danger"
                                    data-toggle="modal"
                                    data-target="#exampleModal">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Confirm delete</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/employee">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="" id="idEmployeeDel">
                            <div class="modal-body">
                                Are you sure to delete this employee?
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Yes</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
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
    function onDelete(idContract) {
        document.getElementById("idContractDel").value = idContract;
    }

    $(document).ready(function () {
        $("#tableServiceDetail").DataTable ({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        })
    })
</script>
</body>
</html>
