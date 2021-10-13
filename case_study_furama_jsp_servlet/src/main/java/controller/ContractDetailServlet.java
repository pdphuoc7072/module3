package controller;

import model.bean.AttachService;
import model.bean.Contract;
import model.bean.ContractDetail;
import model.service.impl.AttachServiceServiceImpl;
import model.service.impl.ContractDetailServiceImpl;
import model.service.impl.ContractServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ContractDetailServlet", urlPatterns = "/contract-detail")
public class ContractDetailServlet extends HttpServlet {
    ContractDetailServiceImpl contractDetailService = new ContractDetailServiceImpl();
    ContractServiceImpl contractService = new ContractServiceImpl();
    AttachServiceServiceImpl attachServiceService = new AttachServiceServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createNewContractDetail (request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm (request, response);
                    break;
                default:
                    listContractDetail (request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listContractDetail (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<ContractDetail> contractDetailList = contractDetailService.selectAllContractDetail();
        List<AttachService> attachServiceList = attachServiceService.selectAllAttachService();
        request.setAttribute("contractDetailList", contractDetailList);
        request.setAttribute("attachServiceList", attachServiceList);
        request.getRequestDispatcher("/contract-detail/list.jsp").forward(request, response);
    }

    private void showCreateForm (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Contract> contractList = contractService.selectAllContracts();
        List<AttachService> attachServiceList = attachServiceService.selectAllAttachService();
        request.setAttribute("contractList", contractList);
        request.setAttribute("attachServiceList", attachServiceList);
        request.getRequestDispatcher("/contract-detail/create.jsp").forward(request, response);
    }

    private void createNewContractDetail (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int contractId = Integer.parseInt(request.getParameter("contract_id"));
        int attachServiceId = Integer.parseInt(request.getParameter("attach_service_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        ContractDetail contractDetail = new ContractDetail(contractId, attachServiceId, quantity);
        contractDetailService.insertContractDetail(contractDetail);
        request.setAttribute("message", "Create successful");
        request.getRequestDispatcher("/contract-detail/create.jsp").forward(request, response);
    }
}