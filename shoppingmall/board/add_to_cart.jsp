<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*, javax.servlet.*, javax.servlet.http.*" %>

<%
    String action = request.getParameter("action");
    if (action != null && action.equals("add_cart")) {
        String productId = request.getParameter("product_id_display");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int totalPrice = Integer.parseInt(request.getParameter("hidden_total_price"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        cart.add(new CartItem(productId, quantity, totalPrice));
        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
%>

<%! 
    class CartItem {
        String productId;
        int quantity;
        int totalPrice;

        public CartItem(String productId, int quantity, int totalPrice) {
            this.productId = productId;
            this.quantity = quantity;
            this.totalPrice = totalPrice;
        }

        public String getProductId() {
            return productId;
        }

        public int getQuantity() {
            return quantity;
        }

        public int getTotalPrice() {
            return totalPrice;
        }
    }
%>

</body>
</html>