// 하트 토글 기능
function toggleHeart(icon) {
    console.log('클릭완료');
    icon.classList.toggle("active");
}

function filterAction(button, id, type) {

    let pageSize = document.getElementById('pageSize').value;
    let filterBtn = document.getElementsByClassName('filter-btn');

    for(let i=0; i<filterBtn.length; i++) {
        filterBtn[i].classList.remove('selected');
    }

    button.classList.add('selected');
	
    let url = `/main/subMain?page=1&pageSize=${pageSize}`;

    if (type == 'categories') {
        url += `&categoriesId=${id}`;
    }

    if (type == 'areas') {
        url += `&areasId=${id}`;
    }

    location.href = url;
}

function resetBtnAction() {
    location.href = '/main/subMain';
}

function goToDetailPage(item) {
	
	const keyword = item.getAttribute("data-keyword");
	const encodedKeyword = encodeURIComponent(keyword);
	location.href = "/main/subMain/detail/" + encodedKeyword;
	
}


