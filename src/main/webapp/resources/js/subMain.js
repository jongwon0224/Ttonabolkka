// 하트 토글 기능
function toggleHeart(icon) {
    console.log('클릭완료');
    icon.classList.toggle("active");
}

function filterAction(button, id, type) {

//    let currentPage = document.getElementById('currentPage').value || 1;
    let pageSize = document.getElementById('pageSize').value;

    let filterBtn = document.getElementsByClassName('filter-btn');

    for(let i=0; i<filterBtn.length; i++) {
        filterBtn[i].classList.remove('selected');
    }

    button.classList.add('selected');

//    location.href = `/subMain?page=1&pageSize=${pageSize}${categoryId?'&categoriesId='+ categoryId:''}`;
	
    let url = `/subMain?page=1&pageSize=${pageSize}`;

    if (type == 'categories') {
        url += `&categoriesId=${id}`;
    }

    if (type == 'areas') {
        url += `&areasId=${id}`;
    }

    location.href = url;
//	console.log(`/subMain?page=1&pageSize=${pageSize}${categoryId?'&categoriesId='+ categoryId:''}`);
}

function resetBtnAction() {
    location.href = '/subMain';
}


