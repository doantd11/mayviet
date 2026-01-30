/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mayviet.util;

/**
 *
 * @author DELL
 */
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

public class MongoDBUtil {

    private static final String URI =
        "mongodb+srv://sa:123@mayviet.jrwyyng.mongodb.net/?retryWrites=true&w=majority";

    private static MongoClient client;
    private static MongoDatabase database;

    // Khởi tạo 1 lần khi Tomcat start
    static {
        client = MongoClients.create(URI);
        database = client.getDatabase("MayViet-db");
        System.out.println("✓ MongoDB connected (Web)");
    }

    public static MongoDatabase getDatabase() {
        return database;
    }

    public static MongoCollection<Document> getCollection(String name) {
        return database.getCollection(name);
    }
}
