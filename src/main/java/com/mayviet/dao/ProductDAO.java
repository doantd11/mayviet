package com.mayviet.dao;

import com.mayviet.model.Product;
import com.mayviet.util.MongoDBUtil;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Updates.inc;

public class ProductDAO {
    private MongoCollection<Document> collection;
    
    public ProductDAO() {
        MongoDatabase database = MongoDBUtil.getDatabase();
        collection = database.getCollection("Products");
    }
    
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        
        for (Document doc : collection.find().filter(eq("status", true))) {
            products.add(documentToProduct(doc));
        }
        
        return products;
    }
    
    public Product getProductById(String id) {
        try {
            Document doc = collection.find(eq("_id", new ObjectId(id))).first();
            
            if (doc != null) {
                // Tăng lượt xem
                collection.updateOne(eq("_id", new ObjectId(id)), inc("views", 1));
                return documentToProduct(doc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    private Product documentToProduct(Document doc) {
        Product product = new Product();
        product.setId(doc.getObjectId("_id"));
        product.setProductName(doc.getString("product_name"));
        product.setDescription(doc.getString("description"));
        
        // Xử lý price - có thể là Integer hoặc Double
        Object priceObj = doc.get("price");
        if (priceObj instanceof Integer) {
            product.setPrice((Integer) priceObj);
        } else if (priceObj instanceof Double) {
            product.setPrice(((Double) priceObj).intValue());
        } else {
            product.setPrice(0);
        }
        
        // Xử lý discount_price
        Object discountPriceObj = doc.get("discount_price");
        if (discountPriceObj instanceof Integer) {
            product.setDiscountPrice((Integer) discountPriceObj);
        } else if (discountPriceObj instanceof Double) {
            product.setDiscountPrice(((Double) discountPriceObj).intValue());
        } else {
            product.setDiscountPrice(0);
        }
        
        // Xử lý quantity
        Object quantityObj = doc.get("quantity");
        if (quantityObj instanceof Integer) {
            product.setQuantity((Integer) quantityObj);
        } else if (quantityObj instanceof Double) {
            product.setQuantity(((Double) quantityObj).intValue());
        } else {
            product.setQuantity(0);
        }
        
        product.setMaterial(doc.getString("material"));
        product.setSize(doc.getString("size"));
        product.setColor(doc.getString("color"));
        
        // Xử lý weight - lấy Double
        Object weightObj = doc.get("weight");
        if (weightObj instanceof Double) {
            product.setWeight((Double) weightObj);
        } else if (weightObj instanceof Integer) {
            product.setWeight(((Integer) weightObj).doubleValue());
        } else {
            product.setWeight(0.0);
        }
        
        product.setMainImage(doc.getString("main_image"));
        
        // Xử lý views
        Object viewsObj = doc.get("views");
        if (viewsObj instanceof Integer) {
            product.setViews((Integer) viewsObj);
        } else if (viewsObj instanceof Double) {
            product.setViews(((Double) viewsObj).intValue());
        } else {
            product.setViews(0);
        }
        
        // Xử lý sold
        Object soldObj = doc.get("sold");
        if (soldObj instanceof Integer) {
            product.setSold((Integer) soldObj);
        } else if (soldObj instanceof Double) {
            product.setSold(((Double) soldObj).intValue());
        } else {
            product.setSold(0);
        }
        
        product.setStatus(doc.getBoolean("status", false));
        product.setFeatured(doc.getBoolean("is_featured", false));
        product.setNew(doc.getBoolean("is_new", false));
        product.setCreatedAt(doc.getDate("created_at"));
        product.setUpdatedAt(doc.getDate("updated_at"));
        
        return product;
    }
}