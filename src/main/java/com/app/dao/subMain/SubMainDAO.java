package com.app.dao.subMain;

import java.util.List;

import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;

public interface SubMainDAO {

	
	List<Places> findPlacesList();
	List<Categories> findCategoriesList();
	List<Places> findPlacesByCategoriesId(List<String> categoriesId);
}
