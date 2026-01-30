<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Sản phẩm - MayViet Shop</title>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: system-ui, -apple-system, BlinkMacSystemFont,
                    "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
                background: #f5f1ea; /* nền giấy thủ công */
                min-height: 100vh;
                padding: 30px 15px;
                color: #4b3621;
            }

            .container {
                max-width: 1200px;
                margin: auto;
            }

            /* ===== PAGE TITLE ===== */
            .header {
                text-align: center;
                margin: 40px 0 50px;
            }

            .header h1 {
                font-size: 2.8rem;
                font-weight: 800;
                color: #6b4f31;
            }

            .header p {
                margin-top: 10px;
                font-size: 1.1rem;
                color: #8b6b4a;
            }

            /* ===== GRID ===== */
            .products-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 36px;
            }

            /* ===== CARD ===== */
            .product-card {
                background: #fffdf8;
                border-radius: 20px;
                overflow: hidden;
                border: 1px solid #e6dccf;
                box-shadow: 0 8px 22px rgba(0, 0, 0, 0.12);
                transition: all 0.35s ease;
                cursor: pointer;
            }

            .product-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 18px 36px rgba(0, 0, 0, 0.2);
            }

            /* ===== IMAGE ===== */
            .product-image {
                width: 100%;
                height: 240px;
                object-fit: cover;
                background: #eee;
            }

            /* ===== INFO ===== */
            .product-info {
                padding: 20px 22px 24px;
            }

            .badge {
                display: inline-block;
                padding: 5px 14px;
                border-radius: 999px;
                font-size: 0.7rem;
                font-weight: 700;
                margin-right: 6px;
            }

            .badge-new {
                background: #6ba368;
                color: white;
            }

            .badge-featured {
                background: #c89b3c;
                color: white;
            }

            .product-name {
                font-size: 1.15rem;
                font-weight: 700;
                color: #4b3621;
                margin: 12px 0 6px;
                line-height: 1.4;
            }

            .product-description {
                font-size: 0.9rem;
                color: #7a6248;
                margin-bottom: 16px;
                line-height: 1.5;
            }

            /* ===== PRICE ===== */
            .product-price {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 14px;
            }

            .discount-price {
                font-size: 1.35rem;
                font-weight: 800;
                color: #8b5e2f;
            }

            .original-price {
                font-size: 0.9rem;
                color: #b0a090;
                text-decoration: line-through;
            }

            /* ===== DETAILS ===== */
            .product-details {
                display: flex;
                justify-content: space-between;
                font-size: 0.75rem;
                color: #8b7a66;
                border-top: 1px dashed #e0d6c8;
                padding-top: 12px;
                margin-bottom: 18px;
            }

            /* ===== BUTTON ===== */
            .view-detail-btn {
                display: block;
                width: 100%;
                padding: 12px;
                border-radius: 999px;
                background: #a67c52;
                color: white;
                font-weight: 700;
                text-align: center;
                text-decoration: none;
                transition: all 0.3s ease;
            }

            .view-detail-btn:hover {
                background: #8c683e;
            }

            /* ===== EMPTY ===== */
            .no-products {
                background: #fffdf8;
                color: #6b4f31;
                padding: 60px;
                text-align: center;
                border-radius: 20px;
                font-size: 1.4rem;
                border: 1px dashed #d8c8b5;
            }

            /* ===== FOOTER CTA (nếu còn dùng) ===== */
            .footer {
                margin-top: 60px;
                text-align: center;
            }

            .footer a {
                color: white;
                text-decoration: none;
                font-weight: 700;
                padding: 14px 36px;
                border-radius: 999px;
                background: #6b4f31;
                transition: all 0.3s ease;
                display: inline-block;
            }

            .footer a:hover {
                background: #4b3621;
            }
            /* ===== CATEGORY ===== */
            .categories {
                display: flex;
                gap: 16px;
                justify-content: center;
                flex-wrap: wrap;
                margin-bottom: 50px;
            }

            .category-item {
                padding: 12px 26px;
                border-radius: 999px;
                background: #fffdf8;
                border: 1px solid #e2d6c6;
                color: #6b4f31;
                font-weight: 600;
                font-size: 0.95rem;
                cursor: pointer;
                transition: all 0.25s ease;
                text-decoration: none;
            }

            .category-item:hover {
                background: #a67c52;
                color: white;
                transform: translateY(-2px);
            }

            .category-item.active {
                background: #6b4f31;
                color: white;
                border-color: #6b4f31;
            }

        </style>
    </head>

    <body>
        <div class="container">
            <jsp:include page="/WEB-INF/header.jsp" />
            <div class="categories">
                <a href="products"
                   class="category-item ${empty param.categoryId ? 'active' : ''}">
                    🌿 Tất cả
                </a>

                <c:forEach var="cat" items="${category}">
                    <a href="products?categoryId=${cat.id}"
                       class="category-item ${param.categoryId == cat.id ? 'active' : ''}">
                        🧺 ${cat.categoryName}
                    </a>
                </c:forEach>
            </div>

            <div class="header">
                <h1>🎀 MayViet Shop</h1>
                <p>Đan truyền thống, Kết hiện đại</p>
            </div>

<h3>DEBUG products = ${products}</h3>
<h3>DEBUG size = ${products.size()}</h3>

            <c:choose>
                <c:when test="${not empty products}">
                    <div class="products-grid">
                        <c:forEach var="product" items="${products}">
                            <div class="product-card"
                                 onclick="location.href = 'product-detail?id=${product.id}'">

                                <img class="product-image"
                                     src="${pageContext.request.contextPath}/images/${product.mainImage}"
                                     onerror="this.src='https://via.placeholder.com/400x300?text=No+Image'">

                                <div class="product-info">

                                    <div>
                                        <c:if test="${product['new']}">
                                            <span class="badge badge-new">MỚI</span>
                                        </c:if>
                                        <c:if test="${product.featured}">
                                            <span class="badge badge-featured">NỔI BẬT</span>
                                        </c:if>
                                    </div>

                                    <h3 class="product-name">${product.productName}</h3>
                                    <p class="product-description">${product.description}</p>

                                    <div class="product-price">
                                        <span class="discount-price">
                                            <fmt:formatNumber value="${product.discountPrice}" groupingUsed="true"/>đ
                                        </span>
                                        <c:if test="${product.price > product.discountPrice}">
                                            <span class="original-price">
                                                <fmt:formatNumber value="${product.price}" groupingUsed="true"/>đ
                                            </span>
                                        </c:if>
                                    </div>

                                    <div class="product-details">
                                        <span>📦 ${product.quantity}</span>
                                        <span>👁 ${product.views}</span>
                                        <span>✅ ${product.sold}</span>
                                    </div>

                                    <a class="view-detail-btn"
                                       href="product-detail?id=${product.id}"
                                       onclick="event.stopPropagation()">
                                        Xem chi tiết
                                    </a>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="no-products">
                        Hiện tại chưa có sản phẩm nào
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="footer">
                <a href="https://www.facebook.com/profile.php?id=61586346971587" target="_blank">
                    📱 Liên hệ Facebook
                </a>
            </div>
            <jsp:include page="/WEB-INF/footer.jsp" />
        </div>
    </body>
</html>
