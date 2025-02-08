package com.app.service.subMain;

import java.util.List;

import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;

public interface SubMainService {

	List<Places> findPlacesList();
	List<Categories> findCategoriesList();
	List<Places> findPlacesByCategoriesId(List<String> categoriesId);
}
