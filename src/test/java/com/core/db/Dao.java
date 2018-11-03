package com.core.db;

public interface Dao {
    void save(Object obj);

    void del(int id);

    Object select(Object[] args);

    void update(Object updatedObj);
}
