package it3191.companion.dao;

import java.util.List;

public interface Dao<T> {	
	/**
	 * @param id
	 * @return
	 * 
	 * Return a single object.
	 */
	public T get(Integer id);

	/**
	 * @param t
	 * 
	 * Persist object parameter. Object will be updated if primary key (id) exist, if not a new record will be created.
	 */
	public void saveOrUpdate(T t);

	/**
	 * @return
	 * 
	 * Return list of all the records.
	 */
	public List<T> getAll();

	/**
	 * @return
	 * 
	 * Return the existing number of records.
	 */
	public Integer countAll();

	/**
	 * @param t
	 * 
	 * Delete object from record.
	 */
	public void delete(T t);
}