<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.productName} - MayViet Shop</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Georgia", "Segoe UI", serif;
            background: #fdfaf4;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1100px;
            margin: auto;
        }

        /* ===== BACK ===== */
        .back-btn {
            display: inline-block;
            margin: 20px 0;
            padding: 12px 24px;
            background: #a67c52;
            color: #fff;
            text-decoration: none;
            border-radius: 999px;
            font-weight: 600;
            transition: 0.3s;
        }

        .back-btn:hover {
            background: #8b633c;
            transform: translateX(-5px);
        }

        /* ===== CARD ===== */
        .product-detail {
            background: #fffaf3;
            border-radius: 26px;
            box-shadow: 0 20px 45px rgba(107,79,49,0.25);
            overflow: hidden;
        }

        .product-header {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            padding: 40px;
        }

        /* ===== IMAGE ===== */
        .product-image-container {
            position: relative;
        }

        .product-image {
            width: 100%;
            height: 480px;
            object-fit: cover;
            border-radius: 18px;
            box-shadow: 0 12px 30px rgba(107,79,49,0.3);
        }

        .badges {
            position: absolute;
            top: 16px;
            left: 16px;
        }

        .badge {
            display: inline-block;
            padding: 7px 16px;
            border-radius: 999px;
            font-size: 0.75rem;
            font-weight: bold;
            margin-right: 6px;
            color: white;
        }

        .badge-new {
            background: #7a5a3a;
        }

        .badge-featured {
            background: #a67c52;
        }

        /* ===== INFO ===== */
        .product-info {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .product-title {
            font-size: 2.3rem;
            color: #4a2f1b;
            margin-bottom: 12px;
        }

        .product-description {
            color: #6b5a4a;
            font-size: 1.05rem;
            line-height: 1.7;
            margin-bottom: 22px;
        }

        /* ===== PRICE ===== */
        .price-section {
            background: linear-gradient(135deg, #a67c52, #7a5a3a);
            color: #fff;
            padding: 24px;
            border-radius: 18px;
            margin-bottom: 26px;
        }

        .price-label {
            font-size: 0.9rem;
            opacity: 0.9;
            margin-bottom: 6px;
        }

        .price-container {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .discount-price {
            font-size: 2.4rem;
            font-weight: 800;
        }

        .original-price {
            font-size: 1.2rem;
            text-decoration: line-through;
            opacity: 0.8;
        }

        .savings {
            margin-top: 10px;
            display: inline-block;
            background: rgba(255,255,255,0.25);
            padding: 6px 14px;
            border-radius: 999px;
            font-size: 0.85rem;
        }

        /* ===== SPECS ===== */
        .product-specs {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 14px;
            margin-bottom: 26px;
        }

        .spec-item {
            background: #f6efe6;
            padding: 16px;
            border-radius: 14px;
            border-left: 5px solid #a67c52;
        }

        .spec-label {
            font-size: 0.8rem;
            color: #8a7a6a;
            margin-bottom: 6px;
        }

        .spec-value {
            font-size: 1.05rem;
            font-weight: 600;
            color: #4a2f1b;
        }

        /* ===== STATS ===== */
        .stats-section {
            display: flex;
            gap: 18px;
            background: #f6efe6;
            padding: 20px;
            border-radius: 16px;
            margin-bottom: 30px;
        }

        .stat-item {
            flex: 1;
            text-align: center;
        }

        .stat-icon {
            font-size: 1.6rem;
            margin-bottom: 6px;
        }

        .stat-value {
            font-size: 1.3rem;
            font-weight: 700;
            color: #7a5a3a;
        }

        .stat-label {
            font-size: 0.85rem;
            color: #6b5a4a;
        }

        /* ===== BUTTON ===== */
        .action-buttons {
            display: flex;
            gap: 16px;
        }

        .btn {
            flex: 1;
            padding: 16px;
            border-radius: 999px;
            font-size: 1rem;
            font-weight: 700;
            text-decoration: none;
            text-align: center;
            transition: 0.3s;
        }

        .btn-facebook {
            background: #6b4f31;
            color: white;
        }

        .btn-facebook:hover {
            background: #5a3f28;
            box-shadow: 0 6px 18px rgba(107,79,49,0.5);
        }

        .btn-back {
            background: #a67c52;
            color: white;
        }

        .btn-back:hover {
            background: #8b633c;
        }

        /* ===== MOBILE ===== */
        @media (max-width: 768px) {
            .product-header {
                grid-template-columns: 1fr;
                padding: 26px;
            }

            .product-image {
                height: 340px;
            }

            .product-title {
                font-size: 1.7rem;
            }

            .product-specs {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/header.jsp"/>

<div class="container">

    <a href="products" class="back-btn">← Quay lại danh sách</a>

    <div class="product-detail">
        <div class="product-header">

            <div class="product-image-container">
                <img src="${pageContext.request.contextPath}/images/${product.mainImage}"
                     alt="${product.productName}"
                     class="product-image"
                     onerror="this.src='https://via.placeholder.com/500?text=No+Image'">

                <div class="badges">
                    <c:if test="${product['new']}">
                        <span class="badge badge-new">MỚI</span>
                    </c:if>
                    <c:if test="${product.featured}">
                        <span class="badge badge-featured">NỔI BẬT</span>
                    </c:if>
                </div>
            </div>

            <div class="product-info">
                <div>
                    <h1 class="product-title">${product.productName}</h1>
                    <p class="product-description">${product.description}</p>

                    <div class="price-section">
                        <div class="price-label">Giá bán</div>
                        <div class="price-container">
                            <span class="discount-price">
                                <fmt:formatNumber value="${product.discountPrice}" groupingUsed="true"/>đ
                            </span>
                            <c:if test="${product.price > product.discountPrice}">
                                <span class="original-price">
                                    <fmt:formatNumber value="${product.price}" groupingUsed="true"/>đ
                                </span>
                            </c:if>
                        </div>

                        <c:if test="${product.price > product.discountPrice}">
                            <c:set var="savings" value="${product.price - product.discountPrice}" />
                            <c:set var="percent" value="${(savings / product.price) * 100}" />
                            <div class="savings">
                                🎉 Tiết kiệm
                                <fmt:formatNumber value="${savings}" groupingUsed="true"/>đ
                                (<fmt:formatNumber value="${percent}" maxFractionDigits="0"/>%)
                            </div>
                        </c:if>
                    </div>

                    <div class="product-specs">
                        <div class="spec-item">
                            <div class="spec-label">Chất liệu</div>
                            <div class="spec-value">${product.material}</div>
                        </div>
                        <div class="spec-item">
                            <div class="spec-label">Kích thước</div>
                            <div class="spec-value">${product.size}</div>
                        </div>
                        <div class="spec-item">
                            <div class="spec-label">Màu sắc</div>
                            <div class="spec-value">${product.color}</div>
                        </div>
                        <div class="spec-item">
                            <div class="spec-label">Khối lượng</div>
                            <div class="spec-value">${product.weight} kg</div>
                        </div>
                    </div>

                    <div class="stats-section">
                        <div class="stat-item">
                            <div class="stat-icon">📦</div>
                            <div class="stat-value">${product.quantity}</div>
                            <div class="stat-label">Còn hàng</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-icon">👁</div>
                            <div class="stat-value">${product.views}</div>
                            <div class="stat-label">Lượt xem</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-icon">✅</div>
                            <div class="stat-value">${product.sold}</div>
                            <div class="stat-label">Đã bán</div>
                        </div>
                    </div>
                </div>

                <div class="action-buttons">
                    <a href="https://www.facebook.com/profile.php?id=61586346971587"
                       target="_blank"
                       class="btn btn-facebook">
                        📱 Liên hệ Facebook
                    </a>
                    <a href="products" class="btn btn-back">
                        ← Xem thêm sản phẩm
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/footer.jsp"/>

</body>
</html>
