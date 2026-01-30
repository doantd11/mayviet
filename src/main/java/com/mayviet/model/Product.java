package com.mayviet.model;

import org.bson.types.ObjectId;
import java.util.Date;

public class Product {
    private ObjectId id;
    private String productName;
    private String description;
    private int price;
    private int discountPrice;
    private int quantity;
    private String material;
    private String size;
    private String color;
    private double weight;
    private String mainImage;
    private int views;
    private int sold;
    private boolean status;
    private boolean isFeatured;
    private boolean isNew;
    private Date createdAt;
    private Date updatedAt;
    
    // Constructors
    public Product() {}
    
    public Product(ObjectId id, String productName, String description, int price, 
                   int discountPrice, int quantity, String material, String size, 
                   String color, double weight, String mainImage) {
        this.id = id;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.discountPrice = discountPrice;
        this.quantity = quantity;
        this.material = material;
        this.size = size;
        this.color = color;
        this.weight = weight;
        this.mainImage = mainImage;
    }
    
    // Getters and Setters
    public ObjectId getId() {
        return id;
    }
    
    public void setId(ObjectId id) {
        this.id = id;
    }
    
    public String getProductName() {
        return productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getPrice() {
        return price;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    
    public int getDiscountPrice() {
        return discountPrice;
    }
    
    public void setDiscountPrice(int discountPrice) {
        this.discountPrice = discountPrice;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getMaterial() {
        return material;
    }
    
    public void setMaterial(String material) {
        this.material = material;
    }
    
    public String getSize() {
        return size;
    }
    
    public void setSize(String size) {
        this.size = size;
    }
    
    public String getColor() {
        return color;
    }
    
    public void setColor(String color) {
        this.color = color;
    }
    
    public double getWeight() {
        return weight;
    }
    
    public void setWeight(double weight) {
        this.weight = weight;
    }
    
    public String getMainImage() {
        return mainImage;
    }
    
    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }
    
    public int getViews() {
        return views;
    }
    
    public void setViews(int views) {
        this.views = views;
    }
    
    public int getSold() {
        return sold;
    }
    
    public void setSold(int sold) {
        this.sold = sold;
    }
    
    public boolean isStatus() {
        return status;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public boolean isFeatured() {
        return isFeatured;
    }
    
    public void setFeatured(boolean featured) {
        isFeatured = featured;
    }
    
    public boolean isNew() {
        return isNew;
    }
    
    public void setNew(boolean isNew) {
        this.isNew = isNew;
    }
    
    public Date getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}